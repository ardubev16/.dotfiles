#!/usr/bin/env bash

set -e

DOTFILES=$HOME/.dotfiles

lua_ver="lua5.3"

###############################################################################

# Helper functions
log_info() {
    printf "\u001b[36m[*] %s\u001b[0m\n" "$@"
}

linux() {
    uname | grep -i Linux &>/dev/null
}
osx() {
    uname | grep -i Darwin &>/dev/null
}

not_supported() {
    printf "\u001b[31m[!] This OS is not yet supported.\u001b[0m\n"
    exit 1
}

install_brew() {
    if ! command -v brew &>/dev/null; then
        log_info "Installing Homebrew"
        bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        log_info "Homebrew already installed"
    fi
    log_info "Installing lua"
    brew install lua
}

install_apt() {
    log_info "Installing lua"
    sudo apt update
    sudo apt install -y "$lua_ver"
}

install_pacman() {
    log_info "Installing lua"
    yes | sudo pacman -S lua
}

install_dnf() {
    log_info "Installing lua"
    sudo dnf install -y lua
}

###############################################################################

# Install lua depending on OS
if osx; then
    log_info "Mac OS detected!"
    install_brew
elif linux; then
    distro=$(grep "^ID=" /etc/os-release | cut -d'=' -f2 | sed -e 's/"//g')
    log_info "$distro detected!"

    case $distro in
    "ubuntu")
        install_apt
        ;;
    "endeavouros" | "arch")
        install_pacman
        ;;
    "fedora")
        install_dnf
        ;;
    *)
        if command -v apt &>/dev/null; then
            install_apt
        else
            not_supported
        fi
        ;;
    esac
else
    not_supported
fi

# Install dotfiles with lua script
exec "$DOTFILES"/install.lua
