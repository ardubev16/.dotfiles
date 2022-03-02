# Dotfiles

My personal .dotfiles repository.

## TODO:

* fix stow: if file already exist -> error, shell error if want to restow
* $PATH: $PATH is full of junk, needs cleanup
* bins: add more custom scripts to optimize workflow
* tmux: move .tmux folder to standard ~/.config/tmux 

## Modules

* bin:
    * various shell scripts to make life easier
* git:
    * git name, email configuration
* nvim:
    * neovim configuration, /plugin contains subject specific configs
* tmux:
    * terminal multiplexer configs, /.tmux contains cht.sh commands & languages lists
* zsh:
    * shell configuration, uses Antibody, **WIP**
* ulauncher:
    * spotlight like search bar
    * only Linux
* alacritty:
    * Cool terminal emulator
    * only Xubuntu
* autostart:
    * autostart folder for ulauncher and plank
    * only Xubuntu
* plank:
    * temporary dock, will not use it for long
    * only Xubuntu

## Installation

Uses nix packet manager, so no need to manually install dependencies. Maybe on MacOS needs to install XCode CLI tools:

```bash
xcode-select --install
```

Then clone the repo in the home directory: ~/.dotfilse.

```bash
git clone https://github.com/ardubev16/.dotfiles
./.dotfiles/install.sh
```

`install.sh` will do the following things:

1. install nix packet manager
1. install dependencies: zsh, antibody, git, neovim, tmux, stow, fzf, bat, gcc
1. set zsh as default shell
1. creates Antibody plugin bundle
1. installs Neovim plugins
1. ...(use stow to create simlinks for all configurations)
