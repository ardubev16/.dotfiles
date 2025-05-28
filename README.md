# Dotfiles

My personal .dotfiles repository, using Nix and Home-Manager.

## Installation

Run `./install.sh`

## Fixes

- If fonts are updated, run the following to make them work correctly:
  - `rm -r ~/.cache/fontconfig`
  - `fc-cache -vr`

## Modules

> [!NOTE]
> Undergoing changes. The general structure follows [Numtide Blueprint](https://github.com/numtide/blueprint).
