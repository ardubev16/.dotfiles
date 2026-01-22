#!/usr/bin/env bash

set -euxo pipefail

main() {
    if ! command -v kmonad &>/dev/null; then
        echo "kmonad is not installed"
        exit 1
    fi

    local -r kmonad_path=$(dirname "$(realpath "$0")")
    local -r service_file_path="$kmonad_path/$(hostname)/kmonad.service"

    if [[ ! -f "$service_file_path" ]]; then
        echo "Service file not found for current host: $service_file_path"
        exit 1
    fi

    sudo cp "$service_file_path" /etc/systemd/system/kmonad.service
    sudo systemctl daemon-reload
    sudo systemctl enable kmonad.service
    sudo systemctl restart kmonad.service
}

main
