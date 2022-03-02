#!/usr/bin/env bash

# install nix
sh <(curl -L https://nixos.org/nix/install)

# source nix
source $HOME/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
        nixpkgs.zsh \
        nixpkgs.antibody \
        nixpkgs.git \
        nixpkgs.neovim \
        nixpkgs.tmux \
        nixpkgs.stow \
        nixpkgs.fzf \
        nixpkgs.bat \
        nixpkgs.gcc \


mv ~/.zshrc ~/.zshrc.old
