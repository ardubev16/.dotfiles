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

install_nix() {
    if [[ -n $(command -v nix) ]]; then
        echo "nix already installed"
        return
    fi

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
            "home-manager --extra-experimental-features 'nix-command flakes' switch --flake ."
    fi
}

main() {
    # setup_keyd

    git submodule update --init --recursive

    install_nix
    home_manager_switch
}

main
