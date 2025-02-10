#!/usr/bin/env bash

set -euo pipefail

check_dependencies() {
    local -r dependencies=(
        "git"
        "curl"
    )

    local not_met=false
    for dep in "${dependencies[@]}"; do
        if [[ -z $(command -v "$dep") ]]; then
            echo "$dep is not installed"
            not_met=true
        fi
    done

    if [[ "$not_met" == true ]]; then
        exit 1
    fi
}

install_nix() {
    if [[ -n $(command -v nix) ]]; then
        return
    fi

    echo "[+] Installing Nix"
    # see: https://github.com/DeterminateSystems/nix-installer
    curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix |
        sh -s -- install

    source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
}

home_manager_switch() {
    if [[ -n $(command -v home-manager) ]]; then
        home-manager switch --flake .
    else
        nix-shell -p home-manager --run \
            'home-manager --extra-experimental-features "nix-command flakes" switch --flake ".#${USER}@${HOSTNAME}"'
    fi
}

main() {
    check_dependencies

    git submodule update --init --recursive

    install_nix
    home_manager_switch
}

main
