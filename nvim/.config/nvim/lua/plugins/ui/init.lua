return {
    require('plugins.ui.gruvbox'),
    require('plugins.ui.bufferline'),
    require('plugins.ui.illuminate'),
    require('plugins.ui.lualine'),
    require('plugins.ui.notify'),
    -- require('plugins.ui.noice'),

    {
        'j-hui/fidget.nvim',
        event = 'VeryLazy',
        config = {},
    },
}
