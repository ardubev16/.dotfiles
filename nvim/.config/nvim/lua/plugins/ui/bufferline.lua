local M = {
    'akinsho/bufferline.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    event = 'BufAdd',
}

function M.config()
    require('bufferline').setup({
        options = {
            mode = 'buffers', -- set to "tabs" to only show tabpages instead
            numbers = 'ordinal', -- "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
            close_command = 'Bdelete! %d', -- can be a string | function, see "Mouse actions"
            right_mouse_command = 'Bdelete! %d', -- can be a string | function, see "Mouse actions"
            left_mouse_command = 'buffer %d', -- can be a string | function, see "Mouse actions"
            middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
            indicator = {
                icon = '▎',
            },
            buffer_close_icon = '',
            modified_icon = '●',
            close_icon = '',
            left_trunc_marker = '',
            right_trunc_marker = '',
            max_name_length = 18,
            max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
            tab_size = 18,
            diagnostics = 'nvim_lsp', -- false | "nvim_lsp" | "coc",
            diagnostics_update_in_insert = false,
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local s = ' '
                if level == 'error' then
                    s = ''
                elseif level == 'warning' then
                    s = ''
                elseif level == 'hint' then
                    s = ''
                elseif level == 'info' then
                    s = ''
                end
                return s
            end,
            offsets = {
                {
                    filetype = 'NvimTree',
                    text = 'File Explorer',
                    highlight = 'Directory',
                    text_align = 'center',
                },
            },
            color_icons = true, -- whether or not to add the filetype icon highlights
            show_buffer_icons = true, -- disable filetype icons for buffers
            show_buffer_close_icons = false,
            show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
            show_close_icon = false,
            show_tab_indicators = true,
            persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
            -- can also be a table containing 2 custom separators
            -- [focused and unfocused]. eg: { '|', '|' }
            separator_style = 'thin', -- "slant" | "thick" | "thin" | { 'any', 'any' },
            enforce_regular_tabs = true,
            always_show_bufferline = true,
            -- TODO: sort buffers by some criteria
            -- sort_by = 'insert_after_current' | 'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
            --     -- add custom logic
            --     return buffer_a.modified > buffer_b.modified
            -- end
        },
    })
end

function M.init()
    local opts = { noremap = true, silent = true }

    vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>', opts)
    vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>', opts)
    vim.keymap.set('n', '<leader>x', '<cmd>bdelete<CR>', opts)
    vim.keymap.set('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<CR>', opts)
    vim.keymap.set('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<CR>', opts)
    vim.keymap.set('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<CR>', opts)
    vim.keymap.set('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<CR>', opts)
    vim.keymap.set('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5<CR>', opts)
    vim.keymap.set('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6<CR>', opts)
    vim.keymap.set('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7<CR>', opts)
    vim.keymap.set('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8<CR>', opts)
    vim.keymap.set('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9<CR>', opts)
end

return M
