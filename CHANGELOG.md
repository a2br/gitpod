# Changelog

All notable changes to this project will be documented in this file.

## June 2021

- Breaking Change: Make ports configured in `.gitpod.yml` private by default when no value for `visibility` is given (was public). This change is for security reasons. ([#4548](https://github.com/gitpod-io/gitpod/pull/4548))
- Fix active workspace list in dashboard (show also older pinned workspaces) ([#4523](https://github.com/gitpod-io/gitpod/pull/4523))
- Adding `ItemsList` component as a more maintainable and consistent way to render a list of workspaces, git integrations, environment variables, etc. ([#4454](https://github.com/gitpod-io/gitpod/pull/4454))
- Improve backup stability when pods get evicted ([#4405](https://github.com/gitpod-io/gitpod/pull/4405))
- Fix text color in workspaces list for dark theme ([#4410](https://github.com/gitpod-io/gitpod/pull/4410))
- Better reflect incremental prebuilds in prebuilt workspace logs ([#4293](https://github.com/gitpod-io/gitpod/pull/4293))
- Run shellcheck against scripts ([#4280](https://github.com/gitpod-io/gitpod/pull/4280))
- Implement new Project and Team DB tables and entities ([#4368](https://github.com/gitpod-io/gitpod/pull/4368))
- On gitpod.io 404 redirect to www.gitpod.io ([#4364](https://github.com/gitpod-io/gitpod/pull/4364))
- Fix disk space leak in ws-manager ([#4388](https://github.com/gitpod-io/gitpod/pull/4388))
- Fix memory leak in ws-manager ([#4384](https://github.com/gitpod-io/gitpod/pull/4384))
- Handle GitHub issues page context URL ([#4370](https://github.com/gitpod-io/gitpod/pull/4370))
- Fix issues blocking SSH from local terminal ([#4358](https://github.com/gitpod-io/gitpod/pull/4358))
- Fix remote tracking branch for issue context ([#4367](https://github.com/gitpod-io/gitpod/pull/4367))
- Fix opening empty repositories ([#4337](https://github.com/gitpod-io/gitpod/pull/4337))

## May 2021

- Support multiple “Recent” projects with the same title in the dashboard ([#4312](https://github.com/gitpod-io/gitpod/pull/4312))
- Add `imagebuild/` context URL prefix that triggers a re-build of the workspace image([#4261](https://github.com/gitpod-io/gitpod/pull/4261))
- Add incremental prebuilds feature ([#4167](https://github.com/gitpod-io/gitpod/pull/4167))
- Update VSCode to version 1.56.2 ([#4257](https://github.com/gitpod-io/gitpod/pull/4257))
- Add OAuth server to manage access to Gitpod workspaces ([#4222](https://github.com/gitpod-io/gitpod/pull/4222))
- Allow setting customTimeoutAnnotation for headless workspace pods ([#4239](https://github.com/gitpod-io/gitpod/pull/4239))
- Replace nginx proxy with Caddy ([#3964](https://github.com/gitpod-io/gitpod/pull/3964))
- Update `runc` version in ws-deamon ([#4250](https://github.com/gitpod-io/gitpod/pull/4250))
- Hide “stopping” & unpinned workspaces from “Active” in the dashboard ([#4170](https://github.com/gitpod-io/gitpod/pull/4170))
- Update jeager and opentracing dependencies ([#4149](https://github.com/gitpod-io/gitpod/pull/4149))
- Update grpc and k8s dependencies (k8s v1.21.0) ([#4136](https://github.com/gitpod-io/gitpod/pull/4136))
- Remove cerc component ([#4143](https://github.com/gitpod-io/gitpod/pull/4143))
- Remove registry facade socket handover ([#4139](https://github.com/gitpod-io/gitpod/pull/4139))
- Make HTTPS termination default ([#4138](https://github.com/gitpod-io/gitpod/pull/4138))
- Implement admission constraints for Pluggable Workspace Clusters ([#4158](https://github.com/gitpod-io/gitpod/pull/4158))
- Implement new self-hosted setup flow ([#3995](https://github.com/gitpod-io/gitpod/pull/3995))
- Fix Cross Origin Websocket Access (credit: Joern Schneeweisz from the GitLab Security Research Team) ([#4118](https://github.com/gitpod-io/gitpod/pull/4118))

## April 2021

- Hide 'Continue with Default Image' button when Docker build is still running (button did nothing) ([#4104](https://github.com/gitpod-io/gitpod/pull/4104))
- Standardize 'Pending Changes' component in Workspaces List and fix for dark theme ([#4078](https://github.com/gitpod-io/gitpod/pull/4078))
- VS Code: Fix forking certain repositories ([#4098](https://github.com/gitpod-io/gitpod/pull/4098))
- Fix GitHub App installation confirmation flow ([#4093](https://github.com/gitpod-io/gitpod/pull/4093))
- Theia: Fix installing big extensions (e.g. Java, Svelte) ([#4030](https://github.com/gitpod-io/gitpod/pull/4030))
- Ask user for confirmation before deleting an environment variable ([#4051](https://github.com/gitpod-io/gitpod/pull/4051))
- UX: Redirect new/not-signed-in users from gitpod.io to www.gitpod.io ([#4070](https://github.com/gitpod-io/gitpod/pull/4070))
- Fix loading Gitpod's dashboard in Safari < 14 ([#4069](https://github.com/gitpod-io/gitpod/pull/4069))
- Fix the GitHub App's 'addComment' and 'addBadge' features ([#4043](https://github.com/gitpod-io/gitpod/pull/4043))
- Fix VS Code IDE opt-in in "What's New" modal ([#3914](https://github.com/gitpod-io/gitpod/pull/3914))
- Optimize Gitpod's dashboard to make it lighter and load faster ([#3830](https://github.com/gitpod-io/gitpod/pull/3830))
- Implement an alpha version of Gitpod's Local Companion app ([#3958](https://github.com/gitpod-io/gitpod/pull/3958))
- Community contribution ([docs][scripts] fix broken `README.md` weblinks and refactor `protoc-generator.sh` ([#4027](https://github.com/gitpod-io/gitpod/pull/4027))
- Fix VS Code for workspace images based on Ubuntu 18.04 ([#3969](https://github.com/gitpod-io/gitpod/pull/3969))
- Make the Docker daemon in workspaces auto-start when needed by introducing a socket activated 'sudo docker-up' ([#4018](https://github.com/gitpod-io/gitpod/pull/4018))
- Improve the bug report template ([#4017](https://github.com/gitpod-io/gitpod/pull/4017))
- Implement a 'Cancel Downgrade' flow for paid plans ([#3873](https://github.com/gitpod-io/gitpod/pull/3873))
- Fix Git Integrations 'more actions' button placement ([#4007](https://github.com/gitpod-io/gitpod/pull/4007))
- Upgrade to VS Code 1.55.x ([#3937](https://github.com/gitpod-io/gitpod/pull/3937))
- Admin/Self-Hosted: Allow restoring a soft-deleted workspace in one click when still within the grace period ([#3955](https://github.com/gitpod-io/gitpod/pull/3955))
- Implement a Dark Theme ([#3901](https://github.com/gitpod-io/gitpod/pull/3901))
- Don't cache error responses in the dashboard ([#3935](https://github.com/gitpod-io/gitpod/pull/3935))
- Handle 'Email is taken' error case in Login page ([#3950](https://github.com/gitpod-io/gitpod/pull/3950))
- Add OAuth2 host check (credit: Joern Schneeweisz from the GitLab Security Research Team) ([#3940](https://github.com/gitpod-io/gitpod/pull/3940))
- Improve Team plans page layout on smaller screens ([#3845](https://github.com/gitpod-io/gitpod/pull/3845))
- UX: Fix accidental workspace deletion when using the 'Enter' key ([#3945](https://github.com/gitpod-io/gitpod/pull/3945))
- Also show environment variables with identical names but different scopes in the dashboard ([#3938](https://github.com/gitpod-io/gitpod/pull/3938))
- Improve error message when trying to open a Pull Request with deleted branch/fork ([#3869](https://github.com/gitpod-io/gitpod/pull/3869))
- Self-Hosted: Release v0.8.0 ([#3900](https://github.com/gitpod-io/gitpod/pull/3900))
- Self-Hosted: Require Kubernetes 1.17+ ([#3889](https://github.com/gitpod-io/gitpod/pull/3889))
- Redirect to /blocked when trying to create or start a workspace while blocked ([#3785](https://github.com/gitpod-io/gitpod/pull/3785))
- Supervisor: Thread-safe listening to terminals ([#3870](https://github.com/gitpod-io/gitpod/pull/3870))
- Dashboard: Replace nginx with caddy ([#3851](https://github.com/gitpod-io/gitpod/pull/3851))
- Make workspace 'start' / 'stopped' screen resilient to network interruptions ([#3862](https://github.com/gitpod-io/gitpod/pull/3862))
- Fix quantity type conversion in Team plans ([#3866](https://github.com/gitpod-io/gitpod/pull/3866))
- Refresh Gitpod's prebuild welcome message (🍌 → 🤙) ([#3863](https://github.com/gitpod-io/gitpod/pull/3863))
- Community contribution: Don't make `gp` CLI rely on `PATH` to look up `code` ([#3846](https://github.com/gitpod-io/gitpod/pull/3846))
- VS Code: Make extensions host resilient to network interruptions ([#3840](https://github.com/gitpod-io/gitpod/pull/3840))
- Developing Gitpod-in-Gitpod: Upgrade to Go 1.16.3 ([#3820](https://github.com/gitpod-io/gitpod/pull/3820))
