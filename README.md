# Dotfiles

My personal .dotfiles repository.

## Modules

- _git:_ git name, email configuration
- _nvim:_ neovim IDE-like configuration, lsp, autocomplete, ecc.
- _vim:_ basic vim config with some simple plugins for IDE and Editors vim-plugin (e.g. VSCode, IntelliJ, etc.)
- _tmux:_ terminal multiplexer configs, also contains some convenient scripts to use with Tmuxp
- _zsh:_ shell configuration, uses Antibody for the various plugins
- _alacritty:_ cool and minimal terminal emulator
- _i3-xorg:_ all the configs of my desktop environment, including i3, Polybar, Dunst, Rofi

## Installation

Currently supported distros:

- Arch Linux
- Ubuntu

There is a convenience script which hasn't been tested in a while, **use it at your own risk**!

`init.sh` will install lua based on the packet manager available (also install brew on MacOS) and then run `install.lua`.
`install.lua` will do the following:

1. install dependencies
1. set zsh as default shell
1. use stow to create simlinks for all configurations
1. create Antibody plugin bundle
1. install Neovim plugins

## Tmux Keybindings

- `<leader>S`: opens fzf to select one of the folders inside ~/Repos/unitn
- `<leader>P`: opens fzf to select one of the folders inside ~/Repos/personal
- `<leader>W`: opens fzf to select one of the folders inside ~/Repos/work
- `<leader>C`: opens fzf to select one of the folders inside ~/Repos/ctf
- `<leader>A`: opens fzf to select one of the folders inside ~/Repos/\*
