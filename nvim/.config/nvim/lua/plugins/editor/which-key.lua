return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
        local wk = require('which-key')
        wk.setup({
            plugins = { spelling = true },
            key_labels = { ['<leader>'] = 'SPC' },
        })
        wk.register({
            mode = { 'n', 'v' },
            ['g'] = { name = '+goto' },
            [']'] = { name = '+next' },
            ['['] = { name = '+prev' },
            ['<leader>'] = {
                -- ['b'] = { name = '+buffer' },
                ['c'] = { name = '+code' },
                ['f'] = { name = '+file' },
                ['g'] = { name = '+git' },
                ['h'] = { name = '+help' },
                ['n'] = { name = '+neogen' },
                -- ['o'] = { name = '+open' },
                ['s'] = { name = '+search' },
                -- ['t'] = { name = '+toggle' },
                ['x'] = {
                    name = '+diagnostics/quickfix',
                    ['t'] = { name = '+trouble' },
                },
                -- ['w'] = { name = '+windows' },
                -- ['<tab>'] = { name = '+tabs' },
            },
        })
    end,
}
