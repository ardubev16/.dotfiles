return {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    config = {
        signs = {
            add = { text = '▎' },
            change = { text = '▎' },
            delete = { text = '契' },
            topdelete = { text = '契' },
            changedelete = { text = '▎' },
            untracked = { text = '▎' },
        },

        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map('n', '<leader>gj', function()
                if vim.wo.diff then
                    return '<leader>gj'
                end
                vim.schedule(function()
                    gs.next_hunk()
                end)
                return '<Ignore>'
            end, { expr = true })

            map('n', '<leader>gk', function()
                if vim.wo.diff then
                    return '<leader>gk'
                end
                vim.schedule(function()
                    gs.prev_hunk()
                end)
                return '<Ignore>'
            end, { expr = true })

            -- Actions
            map('n', '<leader>gb', gs.blame_line)
            map('n', '<leader>gp', gs.preview_hunk)
            map('n', '<leader>gs', gs.stage_hunk)
            map('n', '<leader>gr', gs.reset_hunk)
            map('n', '<leader>gu', gs.undo_stage_hunk)
            map('n', '<leader>gS', gs.stage_buffer)
            map('n', '<leader>gR', gs.reset_buffer)
            map('n', '<leader>gd', gs.diffthis)
            map('n', '<leader>gD', gs.toggle_deleted)

            -- Text object
            map({ 'o', 'x' }, 'gh', '<cmd><C-U>Gitsigns select_hunk<CR>')
        end,
    },
}
