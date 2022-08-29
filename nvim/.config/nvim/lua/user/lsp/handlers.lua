local M = {}

-- TODO: backfill this to template
M.setup = function()
    local signs = {
        { name = 'DiagnosticSignError', text = '' },
        { name = 'DiagnosticSignWarn', text = '' },
        { name = 'DiagnosticSignHint', text = '' },
        { name = 'DiagnosticSignInfo', text = '' },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
    end

    local config = {
        -- disable virtual text
        virtual_text = false,
        -- show signs
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = 'minimal',
            border = 'rounded',
            source = 'always',
            header = '',
            prefix = '',
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = 'rounded',
    })

    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = 'rounded',
    })
end

local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    local status_ok, illuminate = pcall(require, 'illuminate')
    if not status_ok then
        return
    end
    illuminate.on_attach(client)
    -- TODO: check need to add other to blacklist
    vim.g.Illuminate_ftblacklist = { 'NvimTree', 'Telescope' }
end

local function lsp_keymaps(bufnr)
    -- TODO: learn keymaps
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }
    keymap('n', 'gl', vim.diagnostic.open_float, opts)
    keymap('n', '[d', vim.diagnostic.goto_prev, opts)
    keymap('n', ']d', vim.diagnostic.goto_next, opts)
    keymap('n', '<leader>q', vim.diagnostic.setloclist, opts)

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    keymap('n', 'gD', vim.lsp.buf.declaration, bufopts)
    keymap('n', 'gd', vim.lsp.buf.definition, bufopts)
    keymap('n', 'gr', vim.lsp.buf.references, bufopts)
    keymap('n', 'K', vim.lsp.buf.hover, bufopts)
    keymap('n', 'gi', vim.lsp.buf.implementation, bufopts)
    keymap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    keymap('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    keymap('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    keymap('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    keymap('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    keymap('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    keymap('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    keymap('n', '<leader>f', vim.lsp.buf.format, bufopts)
end

M.on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_ok then
    return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
