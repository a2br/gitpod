# Copyright (c) 2020 Gitpod GmbH. All rights reserved.
# Licensed under the GNU Affero General Public License (AGPL).
# See License-AGPL.txt in the project root for license information.

FROM alpine AS prep
ARG VERSION
ARG IMAGE_PREFIX

WORKDIR /dist
COPY chart--helm helm/
RUN wget https://github.com/mikefarah/yq/releases/download/3.3.2/yq_linux_amd64 && \
    chmod +x yq_linux_amd64 && \
    mv yq_linux_amd64 yq && \
    ./yq w -i helm/gitpod/values.yaml version $VERSION && \
    ./yq w -i helm/gitpod/values.yaml imagePrefix $IMAGE_PREFIX/ && \
    echo ${VERSION} > version && \
    rm yq

COPY install-gcp-terraform-environment-installer--lib terraform/gcp
COPY install-gcp-terraform-modules--installer terraform/gcp/modules
RUN echo "chart_location = \"../helm/gitpod\"" >> installer.auto.tfvars && \
    echo "image_prefix   = \"$IMAGE_PREFIX/\""  >> installer.auto.tfvars && \
    echo "image_version   = \"$VERSION\""       >> installer.auto.tfvars && \
    cp installer.auto.tfvars terraform/gcp && \
    rm installer.auto.tfvars

FROM alpine:3.13

# Ensure latest packages are present, like security updates.
RUN  apk upgrade --no-cache

RUN addgroup -g 1000 installer && \
    adduser -D -G installer -u 1000 installer && \
    mkdir /dist /workspace && \
    chown -R installer:installer /dist /workspace

ENV GITPOD_INSTALLER_IN_DOCKER="true"
ENV KUBECONFIG="/workspace/kubectl"
RUN apk add --no-cache python3 curl git bash ncurses \
  && rm -rf /var/cache/apk/*

RUN curl -o terraform.zip -L https://releases.hashicorp.com/terraform/0.14.2/terraform_0.14.2_linux_amd64.zip && \
    unzip terraform.zip && \
    rm terraform.zip && \
    mv terraform /usr/bin

RUN curl -L https://get.helm.sh/helm-v2.16.10-linux-amd64.tar.gz | tar xz && \
    mv linux-amd64/helm /usr/bin && \
    rm -r linux-amd64

USER installer
WORKDIR /home/installer
RUN curl -L https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-305.0.0-linux-x86_64.tar.gz | tar xz && \
    ./google-cloud-sdk/install.sh && \
    echo source $PWD/google-cloud-sdk/completion.bash.inc >> ~/.bashrc && \
    echo source $PWD/google-cloud-sdk/path.bash.inc >> ~/.bashrc && \
    echo 'export PS1="[\t] \w\\$ "' >> ~/.bashrc

WORKDIR /dist
COPY entrypoint.sh layout.yaml ./
ENV INSTALLER_LAYOUT_FILE=/dist/layout.yaml

COPY --from=prep /dist ./
COPY install-installer--app/installer /usr/bin/gp-install

ENTRYPOINT ["/dist/entrypoint.sh"]
