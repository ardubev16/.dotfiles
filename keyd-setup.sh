#!/usr/bin/env bash

set -euo pipefail

setup_keyd() {
    if [[ -z $(command -v keyd) ]]; then
        echo "keyd is not installed"
        exit 1
    fi

    local -r base_path=$(dirname "$(realpath "$0")")

    sudo cp -r "$base_path/keyd" /etc
    sudo systemctl enable keyd
    sudo systemctl start keyd
}

setup_keyd
