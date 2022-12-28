local M = {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
        {
            'williamboman/mason.nvim',
            config = {},
        },
        'neovim/nvim-lspconfig',
        'tamago324/nlsp-settings.nvim',
        'hrsh7th/cmp-nvim-lsp',
    },
    event = 'BufReadPre',
}

function M.config()
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

    require('mason-lspconfig').setup({
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
            on_attach = require('plugins.lsp.handlers').on_attach,
            capabilities = capabilities,
            -- capabilities = require('plugins.lsp.handlers').capabilities,
        }
        local has_custom_opts, server_custom_opts = pcall(require, 'plugins.lsp.settings.' .. server)
        if has_custom_opts then
            opts = vim.tbl_deep_extend('force', server_custom_opts, opts)
        end
        lspconfig[server].setup(opts)
    end

    require('plugins.lsp.handlers').setup()
end

return M
