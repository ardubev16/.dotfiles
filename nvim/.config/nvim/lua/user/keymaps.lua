local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

-- Remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maploacalleader = ' '

-- Modes
--   normal_mode = "n"
--   insert_mode = "i"
--   visual_mode = "v"
--   visual_block_mode = "x"
--   term_mode = "t"
--   command_mode = "c"

keymap('n', '<leader>e', ':Lex 30<CR>', opts)

-- Y behave like C D
keymap('n', 'Y', 'y$', opts)

-- Keep centered with n N J
keymap('n', 'n', 'nzzzv', opts)
keymap('n', 'N', 'Nzzzv', opts)
keymap('n', 'J', 'mzJ`z', opts)

-- Undo break points with , . ! ?
keymap('i', ',', ',<C-g>u', opts)
keymap('i', '.', '.<C-g>u', opts)
keymap('i', '!', '!<C-g>u', opts)
keymap('i', '?', '?<C-g>u', opts)

-- Move lines
keymap('n', '<A-j>', ':m .+1<CR>==', opts)
keymap('n', '<A-k>', ':m .-2<CR>==', opts)
keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv', opts)
keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv', opts)

-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Yank to clipboard
keymap('n', '<leader>y', '"+y', opts)
keymap('v', '<leader>y', '"+y', opts)
keymap('n', '<leader>Y', 'gg"+yG', opts)

-- Deletes to the black hole register
keymap('x', '<leader>p', '"_dP', opts)
keymap('n', '<leader>d', '"_d', opts)
keymap('v', '<leader>d', '"_d', opts)

-- Git
keymap('n', '<leader>gs', ':G<CR>', opts)
keymap('n', '<leader>gc', ':Git commit<CR>', opts)
keymap('n', '<leader>gd', ':Git diff<CR>', opts)
keymap('n', '<leader>gm', ':Gvdiffsplit!<CR>', opts)
keymap('n', '<leader>gj', ':diffget //3<CR>', opts)
keymap('n', '<leader>gf', ':diffget //2<CR>', opts)
keymap('n', '<leader>ga', ':Git fetch --all<CR>', opts)
