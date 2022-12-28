-- TODO: add more keymaps, find plugin to make this better
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.keymap.set

local Mode = {
    NORMAL = 'n',
    INSERT = 'i',
    VISUAL = 'v',
    VISUAL_BLOCK = 'x',
    TERM = 't',
    COMMAND = 'c',
}

-- Remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maploacalleader = ' '

-- Y behave like C D
keymap(Mode.NORMAL, 'Y', 'y$', opts)

-- Keep centered with n N J
keymap(Mode.NORMAL, 'n', 'nzzzv', opts)
keymap(Mode.NORMAL, 'N', 'Nzzzv', opts)
keymap(Mode.NORMAL, 'J', 'mzJ`z', opts)

-- Undo break points with , . ! ?
keymap(Mode.INSERT, ',', ',<C-g>u', opts)
keymap(Mode.INSERT, '.', '.<C-g>u', opts)
keymap(Mode.INSERT, '!', '!<C-g>u', opts)
keymap(Mode.INSERT, '?', '?<C-g>u', opts)

-- Stay in indent mode
keymap(Mode.VISUAL, '<', '<gv', opts)
keymap(Mode.VISUAL, '>', '>gv', opts)

-- Better window navigation
keymap(Mode.NORMAL, '<C-h>', '<C-w>h', opts)
keymap(Mode.NORMAL, '<C-j>', '<C-w>j', opts)
keymap(Mode.NORMAL, '<C-k>', '<C-w>k', opts)
keymap(Mode.NORMAL, '<C-l>', '<C-w>l', opts)

-- Move lines
keymap(Mode.NORMAL, '<M-j>', '<cmd>m .+1<CR>==', opts)
keymap(Mode.NORMAL, '<M-k>', '<cmd>m .-2<CR>==', opts)
keymap(Mode.VISUAL, '<M-j>', "<cmd>m '>+1<CR>gv=gv", opts)
keymap(Mode.VISUAL, '<M-k>', "<cmd>m '<-2<CR>gv=gv", opts)

-- Yank to clipboard
keymap(Mode.NORMAL, '<leader>y', '"+y', opts)
keymap(Mode.VISUAL, '<leader>y', '"+y', opts)
keymap(Mode.NORMAL, '<leader>Y', 'gg"+yG', opts)

-- Deletes to the black hole register
keymap(Mode.VISUAL_BLOCK, '<leader>p', '"_dP', opts)
keymap(Mode.NORMAL, '<leader>d', '"_d', opts)
keymap(Mode.VISUAL, '<leader>d', '"_d', opts)

-- LSP
keymap(Mode.NORMAL, 'gl', vim.diagnostic.open_float, opts)

-- Telescope
keymap(Mode.NORMAL, '<leader>t', '<cmd>Telescope find_files<CR>', opts)
keymap(Mode.NORMAL, '<C-t>', '<cmd>Telescope live_grep<CR>', opts)

-- Nvimtree
keymap(Mode.NORMAL, '<leader>e', '<cmd>NvimTreeToggle<CR>', opts)

-- Vim fugitive
-- TODO: substitute with gitsigns
keymap(Mode.NORMAL, '<leader>Gs', '<cmd>G<CR>', opts)
-- keymap(Mode.NORMAL, '<leader>Gj', '<cmd>diffget //3<CR>', opts)
-- keymap(Mode.NORMAL, '<leader>Gf', '<cmd>diffget //2<CR>', opts)
-- keymap(Mode.NORMAL, '<leader>Ga', '<cmd>Git fetch --all<CR>', opts)
