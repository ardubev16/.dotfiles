local log_level = {
    COMMAND = 1,
    INFO = 2,
    WARN = 3,
    ERROR = 4,
}
CURR_LEVEL = log_level.INFO

local function reset_color()
    io.write('\27[0m' .. '\n')
end

return {
    set_level = function(level)
        CURR_LEVEL = level
    end,
    command = function(msg)
        if CURR_LEVEL <= log_level.COMMAND then
            io.write('\27[32m[+] ' .. msg)
            reset_color()
        end
    end,
    info = function(msg)
        if CURR_LEVEL <= log_level.INFO then
            io.write('\27[36m[*] ' .. msg)
            reset_color()
        end
    end,
    warn = function(msg)
        if CURR_LEVEL <= log_level.WARN then
            io.write('\27[33m[!] ' .. msg)
            reset_color()
        end
    end,
    error = function(msg)
        if CURR_LEVEL <= log_level.ERROR then
            io.write('\27[31m[!!!] ' .. msg)
            reset_color()
        end
    end,
}
