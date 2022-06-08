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
" Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

Plug 'github/copilot.vim'

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
Plug 'tpope/vim-obsession'

"nerdTree
" Plug 'preservim/nerdtree' |
"             \ Plug 'Xuyuanp/nerdtree-git-plugin' |
"             \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight' |
"             \ Plug 'ryanoasis/vim-devicons'

call plug#end()


let g:coc_global_extensions = ['coc-clangd', 'coc-diagnostic', 'coc-docker', 'coc-json', 'coc-pyright', 'coc-sh', 'coc-solidity', 'coc-sumneko-lua']

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
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

"jumplist with relative jumps <C-o>
" nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
" nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'

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

"NeoFormat
nnoremap <leader>f :Neoformat<CR>

"cpp '//' comment
autocmd FileType cpp setlocal commentstring=//\ %s

"coc maps
nmap <silent> <leader>jd <Plug>(coc-definition)
nmap <silent> <leader>jr <Plug>(coc-references)

"Theme gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = '1'
colorscheme gruvbox
" let g:airline_theme='gruvbox'
" set background=dark
