# Dotfiles

My personal .dotfiles repository.

## TODO:

- neovim: MORE PLUGINSSSS
- tmux: reconfigure using more heavily plugins
- bins: add more custom scripts to optimize workflow

## Modules

- bin:
  - various shell scripts to make life easier
- git:
  - git name, email configuration
- nvim:
  - neovim IDE-like configuration, lsp, autocomplete, ecc.
- vim:
  - basic vim config with some simple plugins for IDE and Editors (e.g. VSCode, IntelliJ, ecc.)
- tmux:
  - terminal multiplexer configs, /.tmux contains cht.sh commands & languages lists
- zsh:
  - shell configuration, uses Antibody, **WIP**
- alacritty:
  - Cool terminal emulator

## Installation

Currently supported distros:

- MacOS
- Ubuntu

Installs packages with the default packet manager for the current distro. On MacOS needs to install XCode CLI tools:

```bash
xcode-select --install
```

Then clone the repo in the home directory: ~/.dotfilse and run the `init.sh` script.

```bash
git clone https://github.com/ardubev16/.dotfiles
./.dotfiles/init.sh
```

`init.sh` will install lua based on the packet manager available (also install brew on MacOS) and then run `install.lua` (**TODO**).
`install.lua` will do the following:

1. install dependencies
1. set zsh as default shell
1. create Antibody plugin bundle
1. install Neovim plugins
1. ...(use stow to create simlinks for all configurations)

## Neovim Keybindings

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
