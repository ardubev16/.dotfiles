local M = {
    'rcarriga/nvim-notify',
    event = 'VeryLazy',
}

function M.config()
    local notify = require('notify')
    notify.setup({
        background_colour = 'Normal',
        fps = 60,
        icons = {
            DEBUG = '',
            ERROR = '',
            INFO = '',
            TRACE = '✎',
            WARN = '',
        },
        level = 2,
        minimum_width = 50,
        max_width = 50,
        render = 'default',
        stages = 'fade',
        timeout = 3000,
        top_down = true,
    })

    -- FIXME: this is a workaround for the multiple offset_encodings issue
    vim.notify = function(msg, ...)
        if msg:match('warning: multiple different client offset_encodings') then
            return
        end

        notify(msg, ...)
    end
end

return M
