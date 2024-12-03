local log = require('installation.logging')

return {
    assert_cmd = function(cmd)
        log.command(cmd)
        local status = os.execute(cmd)
        if status == nil then
            log.error('Failed to execute: ' .. cmd)
            os.exit(1)
        end
    end,
    not_supported = function()
        log.error('This OS is not yet supported.')
        os.exit(1)
    end,
}
