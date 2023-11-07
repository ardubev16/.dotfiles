#!/usr/bin/env bash

extensions=(
    7       # https://extensions.gnome.org/extension/7/removable-drive-menu/
    16      # https://extensions.gnome.org/extension/16/auto-move-windows/
    1319    # https://extensions.gnome.org/extension/1319/gsconnect/
    1460    # https://extensions.gnome.org/extension/1460/vitals/
    3843    # https://extensions.gnome.org/extension/3843/just-perfection/
    4481    # https://extensions.gnome.org/extension/4481/forge/
    5489    # https://extensions.gnome.org/extension/5489/search-light/
    5967    # https://extensions.gnome.org/extension/5967/workspaces-indicator-by-open-apps/
)

gnome-extensions-cli install "${extensions[@]}"
