# Dotfiles

My personal .dotfiles repository.

## TODO:

- bins: add more custom scripts to optimize workflow
- zsh: setup completion through `compinstall`
- nvim: Neoformat lacks configurations

## Modules

- bin:
  - various shell scripts to make life easier
- git:
  - git name, email configuration
- nvim:
  - neovim configuration, /plugin contains subject specific configs
- tmux:
  - terminal multiplexer configs, /.tmux contains cht.sh commands & languages lists
- zsh:
  - shell configuration, uses Antibody, **WIP**
- ulauncher:
  - spotlight like search bar
  - only Linux
- alacritty:
  - Cool terminal emulator
  - only Xubuntu
- autostart:
  - autostart folder for ulauncher and plank
  - only Xubuntu
- plank:
  - temporary dock, will not use it for long
  - only Xubuntu

## Installation

Currently supported distros:

- MacOS
- Ubuntu

Installs packages with the default packet manager for the current distro. On MacOS needs to install XCode CLI tools:

```bash
xcode-select --install
```

Then clone the repo in the home directory: ~/.dotfilse.

```bash
git clone https://github.com/ardubev16/.dotfiles
./.dotfiles/install.sh
```

`install.sh` will do the following things:

1. install dependencies, check `install.sh` for full list
1. set zsh as default shell
1. creates Antibody plugin bundle
1. installs Neovim plugins
1. ...(use stow to create simlinks for all configurations)

## Other

The function structure of `install.sh` is heavily inspired by the _pwndbg_ install script.
