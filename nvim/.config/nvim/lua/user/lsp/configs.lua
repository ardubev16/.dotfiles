local status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status_ok then
    return
end

local servers = {
    'bashls',
    'clangd',
    -- 'ghdl_ls',
    -- 'hdl_checker',
    'html',
    'jsonls',
    'pyright',
    'rust_analyzer',
    'sumneko_lua',
    'tsserver',
    'jdtls',
}

mason_lspconfig.setup({
    ensure_installed = servers,
    automatic_installation = true,
})

-- Tell the server the capability of foldingRange,
-- Neovim hasn't added foldingRange to default capabilities, users must add it manually
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

local lspconfig = require('lspconfig')
for _, server in pairs(servers) do
    local opts = {
        on_attach = require('user.lsp.handlers').on_attach,
        capabilities = capabilities,
        -- capabilities = require('user.lsp.handlers').capabilities,
    }
    local has_custom_opts, server_custom_opts = pcall(require, 'user.lsp.settings.' .. server)
    if has_custom_opts then
        opts = vim.tbl_deep_extend('force', server_custom_opts, opts)
    end
    lspconfig[server].setup(opts)
end
