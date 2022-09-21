require('user.options')
require('user.plugins')
require('user.keymaps')
require('user.autocommands')
require('user.impatient')

require('user.cmp')
require('user.lsp')
require('user.treesitter')
require('user.gitsigns')
-- require('user.dapui')

require('user.misc')
require('user.ui')

-- TODO: find out if this stuff works &/or is necessary
-- "jumplist with relative jumps <C-o>
-- " nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
-- " nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'

-- filetype indent plugin on
-- syntax on
