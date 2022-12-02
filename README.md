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

**WARNING:** Neovim plugins aren't set to a fixed commit, when you install / update them something may brake or not work.

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

## Neovim Keybindings

**WARNING:** This list is not exhaustive

### LSP

Normal mode:

- `gl`: show line diagnostic
- `[d`: show previous diagnostic
- `]d`: show next diagnostic
- `gD`: go to declaration
- `gd`: go to definition
- `gr`: go to references
- `<leader>wa`: add workspace folder
- `<leader>wr`: remove workspace folder
- `<leader>wl`: list workspace folders
- `<leader>rn`: rename variable / function
- `<leader>f`: format buffer
- `<leader>q`, vim.diagnostic.setloclist, opts)
- `K`, vim.lsp.buf.hover, bufopts)
- `gi`, vim.lsp.buf.implementation, bufopts)
- `<C-k>`, vim.lsp.buf.signature_help, bufopts)
- `<leader>D`, vim.lsp.buf.type_definition, bufopts)
- `<leader>ca`, vim.lsp.buf.code_action, bufopts)

### Completion

Insert mode:

- `<C-Space>`: summon autocomplete list

Completion mode:

- `<C-f>`: scroll documentation downwords
- `<C-b>`: scroll documentation upwords
- `<C-e>`: close autocomplete list
- `<C-n>`: next list item
- `<C-p>`: previous list item

### Git

Normal mode:

- `<leader>gj`: go to next hunk
- `<leader>gk`: go to previous hunk
- `<leader>gb`: show line blame
- `<leader>gp`: show hunk preview
- `<leader>gs`: stage hunk
- `<leader>gr`: reset hunk
- `<leader>gu`: undo stage hunk
- `<leader>gS`: stage buffer
- `<leader>gR`: reset buffer
- `<leader>gd`: side to side git diff
- `<leader>gD`: toggle deleted hunks
- `<leader>Gs`: show git status (vim fugitive)

Visual mode:

- `gh`: select current hunk

### Telescope

Normal mode:

- `<leader>t`: find files
- `<C-t>`: grep files

### NvimTree

Normal mode:

- `<leader>e`: open folder tree (NvimTree)

NvimTree:

- `l`, `<CR>`, `o`: open folder / file
- `h`: close folder
- `v`: open in vertical split

### Misc

Normal mode:

- Y behave like C D
- `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>`: better window navigation
- `<S-l>`, `<S-h>`: navigate buffers
- `<M-j>`, `<M-k>`: move lines down and up
- `<leader>y`: yank to clipboard
- `<leader>Y`: yank file to clipboard
- `<leader>d`: delete without overwriting register

Visual mode:

- `<M-j>`, `<M-k>`: move lines down and up
- `<leader>y`: yank to clipboard
- `<leader>p`: paste without overwriting register
- `<leader>d`: delete without overwriting register
