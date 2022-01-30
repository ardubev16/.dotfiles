#!/usr/bin/env zsh
# The Primogen "ubuntu"
# STOW_FOLDERS="alacritty,autostart,bin,git,plank,tmux,ulauncher,nvim,zsh"
if [[ -z $DOTFILES ]]; then
    DOTFILES=$HOME/.dotfiles
fi
source $DOTFILES/zsh/.zsh_paths

# ThePrimogen "install"
pushd $DOTFILES
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    stow -D $folder
    stow $folder
done
popd