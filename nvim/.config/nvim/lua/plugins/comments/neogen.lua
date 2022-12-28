local M = {
    'danymat/neogen',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'L3MON4D3/LuaSnip',
    },
    config = {
        enabled = true,
        snippet_engine = 'luasnip',
    },
}

function M.init()
    local opts = { noremap = true, silent = true }

    vim.keymap.set('n', '<leader>nf', '<cmd>lua require("neogen").generate({ type = "func" })<CR>', opts)
    vim.keymap.set('n', '<leader>nc', '<cmd>lua require("neogen").generate({ type = "class" })<CR>', opts)
    vim.keymap.set('n', '<leader>nt', '<cmd>lua require("neogen").generate({ type = "type" })<CR>', opts)
end

return M
