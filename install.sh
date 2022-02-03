#!/usr/bin/env bash

# install nix
sh <(curl -L https://nixos.org/nix/install)

# source nix
source $HOME/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
        nixpkgs.zsh \
        nixpkgs.git \
        nixpkgs.neovim \
        nixpkgs.tmux \
        nixpkgs.stow \
        nixpkgs.fzf \
        nixpkgs.bat \
        nixpkgs.gcc \



sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

mv ~/.zshrc ~/.zshrc.old
