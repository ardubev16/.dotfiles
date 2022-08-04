"vim-plug plugin manager
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


set colorcolumn=80
set encoding=UTF-8
set expandtab
set exrc
set guicursor=
set hidden
set incsearch
set nobackup
set noerrorbells
set nohlsearch
set noswapfile
set nowrap
set number
set relativenumber
set scrolloff=8
set shiftwidth=4
set showcmd
set signcolumn=yes
set smartindent
set softtabstop=4
set tabstop=4
set termguicolors
set undofile
set wildmenu


call plug#begin()

Plug 'github/copilot.vim'

"themes
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'

"misc
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
"Plug 'tpope/vim-repeat'

call plug#end()


filetype indent plugin on
syntax on

"MAPS
let mapleader = " "

"Y behave like C D
nnoremap Y y$

"keep centered with n N J
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

"undo break points with , . ! ?
" inoremap , ,<C-g>u
" inoremap . .<C-g>u
" inoremap ! !<C-g>u
" inoremap ? ?<C-g>u

"move lines
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"yank to clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

"deletes to the black hole register
xnoremap <leader>p "_dP
nnoremap <leader>d "_d
vnoremap <leader>d "_d

"cpp '//' comment
autocmd FileType cpp setlocal commentstring=//\ %s

"Theme gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = '1'
colorscheme gruvbox
