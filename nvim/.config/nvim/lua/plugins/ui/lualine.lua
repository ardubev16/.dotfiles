local M = {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        -- 'folke/noice.nvim',
    },
    event = 'VeryLazy',
}

function M.config()
    local diagnostics = {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = ' ', warn = ' ', hint = ' ', info = ' ' },
    }

    local diff = {
        'diff',
        cond = function()
            return vim.fn.winwidth(0) > 80
        end,
    }

    local filetype = {
        'filetype',
        colored = false,
    }

    -- local noice = require('noice')

    require('lualine').setup({
        options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
            disabled_filetypes = { 'alpha', 'dashboard', 'NvimTree', 'Outline' },
            always_divide_middle = true,
            globalstatus = false,
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', diff },
            lualine_c = { diagnostics },
            lualine_x = { 'fileformat', 'encoding', filetype },
            lualine_y = { 'progress' },
            lualine_z = { 'location' },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = {
                'location',
                -- {
                --     noice.api.statusline.mode.get,
                --     cond = noice.api.statusline.mode.has,
                --     color = { fg = '#ff9e64' },
                -- },
            },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        extensions = { 'nvim-tree' },
    })
end

return M
