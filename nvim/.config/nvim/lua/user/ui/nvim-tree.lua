local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
    return
end

-- Replaces auto_close
local tree_cb = require('nvim-tree.config').nvim_tree_callback
vim.api.nvim_create_autocmd('BufEnter', {
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match('NvimTree_') ~= nil then
            vim.cmd('quit')
        end
    end,
})

nvim_tree.setup({
    disable_netrw = true,
    ignore_ft_on_setup = {
        'startify',
        'dashboard',
        'alpha',
    },
    view = {
        mappings = {
            custom_only = false,
            list = {
                { key = { 'l', '<CR>', 'o' }, cb = tree_cb('edit') },
                { key = 'h', cb = tree_cb('close_node') },
                { key = 'v', cb = tree_cb('vsplit') },
            },
        },
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    diagnostics = {
        enable = true,
        icons = {
            error = '',
            warning = '',
            hint = '',
            info = '',
        },
    },
    renderer = {
        icons = {
            git_placement = 'signcolumn',
            show = {
                folder_arrow = false,
            },
            glyphs = {
                folder = {
                    default = '',
                    open = '',
                },
            },
        },
    },
})
