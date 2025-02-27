/**
 * Copyright (c) 2021 Gitpod GmbH. All rights reserved.
 * Licensed under the GNU Affero General Public License (AGPL).
 * See License-AGPL.txt in the project root for license information.
 */

import ContextMenu, { ContextMenuEntry } from "./ContextMenu"

export function ItemsList(props: {
    children?: React.ReactNode;
    className?: string;
}) {
    return <div className={`flex flex-col space-y-2 ${props.className || ""}`}>
        {props.children}
    </div>;
}

export function Item(props: {
    children?: React.ReactNode;
    className?: string;
    header?: boolean;
}) {
    const headerClassName = "text-sm text-gray-400 border-t border-b border-gray-200 dark:border-gray-800";
    const notHeaderClassName = "rounded-xl hover:bg-gray-100 dark:hover:bg-gray-800 focus:bg-gitpod-kumquat-light";
    return <div className={`flex flex-grow flex-row w-full px-3 py-3 justify-between transition ease-in-out group ${props.header ? headerClassName : notHeaderClassName} ${props.className || ""}`}>
        {props.children}
    </div>;
}

export function ItemField(props: {
    children?: React.ReactNode;
    className?: string;
}) {
    return <div className={`flex-grow my-auto mx-1 ${props.className || ""}`}>
        {props.children}
    </div>;
}

export function ItemFieldIcon(props: {
    children?: React.ReactNode;
    className?: string;
}) {
    return <div className={`flex self-center w-8 ${props.className || ""}`}>
        {props.children}
    </div>;
}

export function ItemFieldContextMenu(props: {
    menuEntries?: ContextMenuEntry[];
    className?: string;
}) {
    return <div className={`flex self-center hover:bg-gray-200 dark:hover:bg-gray-700 rounded-md cursor-pointer w-8 ${props.className || ""}`}>
        {!props.menuEntries ? null : <ContextMenu menuEntries={props.menuEntries} />}
    </div>;
}
