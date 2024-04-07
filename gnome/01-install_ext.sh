#!/usr/bin/env bash

extensions=(
	7    # https://extensions.gnome.org/extension/7/removable-drive-menu/
	16   # https://extensions.gnome.org/extension/16/auto-move-windows/
	615  # https://extensions.gnome.org/extension/615/appindicator-support/
	1319 # https://extensions.gnome.org/extension/1319/gsconnect/
	1460 # https://extensions.gnome.org/extension/1460/vitals/
	3193 # https://extensions.gnome.org/extension/3193/blur-my-shell/
	3843 # https://extensions.gnome.org/extension/3843/just-perfection/
	3956 # https://extensions.gnome.org/extension/3956/gnome-fuzzy-app-search/
	4481 # https://extensions.gnome.org/extension/4481/forge/
	5489 # https://extensions.gnome.org/extension/5489/search-light/
	5724 # https://extensions.gnome.org/extension/5724/battery-health-charging/
	5967 # https://extensions.gnome.org/extension/5967/workspaces-indicator-by-open-apps/
)

if ! command -v gnome-extensions-cli &>/dev/null; then
	echo "gnome-extensions-cli could not be found, installing..."
	pipx install gnome-extensions-cli
fi
gnome-extensions-cli install "${extensions[@]}"
