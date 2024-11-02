#!/usr/bin/env bash

extensions=(
    615  # https://extensions.gnome.org/extension/615/appindicator-support/
    16   # https://extensions.gnome.org/extension/16/auto-move-windows/
    5724 # https://extensions.gnome.org/extension/5724/battery-health-charging/
    4481 # https://extensions.gnome.org/extension/4481/forge/
    3956 # https://extensions.gnome.org/extension/3956/gnome-fuzzy-app-search/
    1319 # https://extensions.gnome.org/extension/1319/gsconnect/
    3843 # https://extensions.gnome.org/extension/3843/just-perfection/
    600  # https://extensions.gnome.org/extension/600/launch-new-instance/
    7    # https://extensions.gnome.org/extension/7/removable-drive-menu/
    5489 # https://extensions.gnome.org/extension/5489/search-light/
    1460 # https://extensions.gnome.org/extension/1460/vitals/
    5967 # https://extensions.gnome.org/extension/5967/workspaces-indicator-by-open-apps/
)

if ! command -v gnome-extensions-cli &>/dev/null; then
    echo "gnome-extensions-cli could not be found, installing..."
    pipx install gnome-extensions-cli
fi
gnome-extensions-cli install "${extensions[@]}"
