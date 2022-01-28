"vim-plug plugin manager
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()

"themes
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'

"syntax highlighting
Plug 'sheerun/vim-polyglot'

"prettier
Plug 'sbdchd/neoformat'

"lsp
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"telescope
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-fzy-native.nvim'

"misc
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

"nerdTree
" Plug 'preservim/nerdtree' |
"             \ Plug 'Xuyuanp/nerdtree-git-plugin' |
"             \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight' |
"             \ Plug 'ryanoasis/vim-devicons'

call plug#end()


"MAPS
let mapleader = " "

"Y behave like C D
nnoremap Y y$

"keep centered with n N J
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

"undo break points with , . ! ?
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

"jumplist with relative jumps <C-o>
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'

"move lines
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = '1'
colorscheme gruvbox
" let g:airline_theme='gruvbox'
" set background=dark
filetype indent plugin on
syntax on
