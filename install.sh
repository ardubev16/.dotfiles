#!/usr/bin/env bash

# define ZDOTDIR
if [ -z $ZDOTDIR ]; then
    ZDOTDIR=$HOME/.config/zsh
fi

# define nix packages
packages=(
    antibody
    bat
    fzf
    gcc
    git
    neovim
    stow
    tmux
    zsh
)

#define stow_dirs
stow_dirs=(
    bin
    git
    nvim
    tmux
    zsh
)

# ============================================================================

# install and sources nix if not installed
echo "* Installing nix"
if ! command -v nix-env &> /dev/null; then
    sh <(curl -L https://nixos.org/nix/install)
    source $HOME/.nix-profile/etc/profile.d/nix.sh
fi

# install nix packages
echo "* Installing nix packages"
for package in ${packages[@]}; do
    nix-env -iA nixpkgs.$package
done

# stow stow_dirs
echo "* Stowing dirs"
for stow_dir in ${stow_dirs[@]}; do
    stow $stow_dir
done

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins
echo "* Bundling antibody plugins"
antibody bundle < $ZDOTDIR/plugins.txt > $ZDOTDIR/.plugins

# install neovim plugins
echo "* Installing Neovim plugins"
nvim --headless +PlugInstall +quitall

# starts/restarts zsh
echo "* Starting zsh"
exec zsh
