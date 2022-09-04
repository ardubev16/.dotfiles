-- TODO: add more keymaps, find plugin to make this better
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

-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Navigate buffers
keymap('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>', opts)
keymap('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>', opts)
keymap('n', '<leader>x', '<cmd>Bdelete<CR>', opts)
keymap('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<CR>', opts)
keymap('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<CR>', opts)
keymap('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<CR>', opts)
keymap('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<CR>', opts)
keymap('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5<CR>', opts)
keymap('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6<CR>', opts)
keymap('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7<CR>', opts)
keymap('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8<CR>', opts)
keymap('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9<CR>', opts)

-- Move lines
keymap('n', '<M-j>', '<cmd>m .+1<CR>==', opts)
keymap('n', '<M-k>', '<cmd>m .-2<CR>==', opts)
keymap('v', '<M-j>', "<cmd>m '>+1<CR>gv=gv", opts)
keymap('v', '<M-k>', "<cmd>m '<-2<CR>gv=gv", opts)

-- Yank to clipboard
keymap('n', '<leader>y', '"+y', opts)
keymap('v', '<leader>y', '"+y', opts)
keymap('n', '<leader>Y', 'gg"+yG', opts)

-- Deletes to the black hole register
keymap('x', '<leader>p', '"_dP', opts)
keymap('n', '<leader>d', '"_d', opts)
keymap('v', '<leader>d', '"_d', opts)

-- Telescope
keymap('n', '<leader>t', '<cmd>Telescope find_files<CR>', opts)
keymap('n', '<C-t>', '<cmd>Telescope live_grep<CR>', opts)

-- Nvimtree
keymap('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', opts)

-- Neogen
keymap('n', '<leader>nf', '<cmd>lua require("neogen").generate({ type = "func" })<CR>', opts)
keymap('n', '<leader>nc', '<cmd>lua require("neogen").generate({ type = "class" })<CR>', opts)
keymap('n', '<leader>nt', '<cmd>lua require("neogen").generate({ type = "type" })<CR>', opts)

-- Vim fugitive
-- TODO: substitute with gitsigns
keymap('n', '<leader>Gs', '<cmd>G<CR>', opts)
-- keymap('n', '<leader>Gj', '<cmd>diffget //3<CR>', opts)
-- keymap('n', '<leader>Gf', '<cmd>diffget //2<CR>', opts)
-- keymap('n', '<leader>Ga', '<cmd>Git fetch --all<CR>', opts)
