local M = {
    'folke/todo-comments.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    cmd = { 'TodoTrouble', 'TodoTelescope' },
    event = 'BufReadPost',
    config = {},
}

-- stylua: ignore
M.keys = {
    { ']t', function() require('todo-comments').jump_next() end, desc = 'Next todo comment' },
    { '[t', function() require('todo-comments').jump_prev() end, desc = 'Previous todo comment' },
    { '<leader>xta', '<cmd>TodoTrouble<cr>', desc = 'Todo All' },
    { '<leader>xtt', '<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>', desc = 'Todo Trouble' },
    { '<leader>xT', '<cmd>TodoTelescope<cr>', desc = 'Todo Telescope' },
}

return M
