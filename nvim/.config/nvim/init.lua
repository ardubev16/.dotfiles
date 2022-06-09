require('user.options')
require('user.keymaps')
require('user.plugins')
require('user.colorscheme')
require('user.cmp')
require('user.lsp')
require('user.telescope')
require('user.treesitter')
require('user.autopairs')
require('user.comment')
require('user.gitsigns')


-- "cpp '//' comment
-- autocmd FileType cpp setlocal commentstring=//\ %s

-- "jumplist with relative jumps <C-o>
-- " nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
-- " nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'

-- filetype indent plugin on
-- syntax on
