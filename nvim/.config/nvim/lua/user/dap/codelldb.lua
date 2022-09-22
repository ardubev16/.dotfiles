local dap = require('dap')

dap.adapters.codelldb = {
    type = 'server',
    port = '${port}',
    executable = {
        -- TODO: automatically download and unzip extension
        -- @see https://github.com/vadimcn/vscode-lldb/releases
        command = '$XDG_DATA_HOME/codelldb/extension/adapter/codelldb',
        args = { '--port', '${port}' },
    },
}

dap.configurations.cpp = {
    {
        name = 'Launch file',
        type = 'codelldb',
        request = 'launch',
        -- TODO: automatically compile the program and get the path to the executable
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
    },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
