#!/usr/bin/env bash

# define ZDOTDIR and DOTFILES
if [[ -z $ZDOTDIR ]]; then
    ZDOTDIR=$HOME/.config/zsh
fi
if [[ -z $DOTFILES ]]; then
    DOTFILES=$HOME/.dotfiles
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
    thefuck
    tmux
    zsh
)

# define stow_dirs
stow_dirs=(
    bin
    git
    nvim
    tmux
    zsh
)

# ============================================================================

# install and sources nix if not installed
if ! command -v nix-env &>/dev/null; then
    echo "* Installing Nix"
    sh <(curl -L https://nixos.org/nix/install)
    source $HOME/.nix-profile/etc/profile.d/nix.sh
else
    echo "* Nix already installed"
fi

# install nix packages
echo "* Installing Nix packages"
for package in ${packages[@]}; do
    nix-env -iA nixpkgs.$package
done

# stow stow_dirs
echo "* Stowing dirs"
pushd $DOTFILES 1>/dev/null
for stow_dir in ${stow_dirs[@]}; do
    stow -R $stow_dir 2>/dev/null # throws a warning for some reason, works anyway
done
popd 1>/dev/null

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins
echo "* Bundling antibody plugins"
antibody bundle <$ZDOTDIR/00-plugins.txt >$ZDOTDIR/.plugins

# install neovim plugins
echo "* Installing Neovim plugins"
nvim --headless +PlugInstall +quitall

# starts/restarts zsh
echo "* Starting Zsh"
exec zsh
