local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
local code_actions = null_ls.builtins.code_actions
local hover = null_ls.builtins.hover

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == 'null-ls'
        end,
        bufnr = bufnr,
    })
end

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
null_ls.setup({
    on_attach = function(client, bufnr)
        if client.supports_method('textDocument/formatting') then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    lsp_formatting(bufnr)
                end,
            })
        end
    end,
    debug = false,
    sources = {
        -- js, ts
        formatting.eslint_d,
        diagnostics.eslint_d,
        code_actions.eslint_d,
        -- html, xml
        formatting.tidy,
        diagnostics.tidy,
        -- shell
        formatting.shellharden.with({ extra_filetypes = { 'zsh' } }),
        diagnostics.shellcheck.with({ extra_filetypes = { 'zsh' } }),
        code_actions.shellcheck.with({ extra_filetypes = { 'zsh' } }),
        hover.printenv.with({ extra_filetypes = { 'zsh' } }),
        -- lua
        formatting.stylua,
        -- python
        -- diagnostics.flake8
    },
})
