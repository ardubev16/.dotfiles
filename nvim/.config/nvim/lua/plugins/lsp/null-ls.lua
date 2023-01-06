local M = {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
}

function M.config()
    local null_ls = require('null-ls')

    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions
    local hover = null_ls.builtins.hover

    null_ls.setup({
        sources = {
            -- c, cpp
            formatting.clang_format.with({
                -- FIXME: works only on save (had to also write it to ~/.clang-format)
                extra_args = { '--style={IndentWidth: 4}' },
            }),
            diagnostics.cppcheck,
            -- js, ts
            formatting.eslint_d,
            -- formatting.prettier,
            diagnostics.eslint_d,
            code_actions.eslint_d,
            -- html, xml
            formatting.tidy.with({ extra_filetypes = { 'handlebars' } }),
            diagnostics.tidy.with({ extra_filetypes = { 'handlebars' } }),
            -- shell
            formatting.shellharden.with({ extra_filetypes = { 'zsh' } }),
            diagnostics.shellcheck.with({ extra_filetypes = { 'zsh' } }),
            code_actions.shellcheck.with({ extra_filetypes = { 'zsh' } }),
            hover.printenv.with({ extra_filetypes = { 'zsh' } }),
            -- lua
            formatting.stylua.with({
                extra_args = { '--indent-type', 'Spaces', '--indent-width', 4, '--quote-style', 'AutoPreferSingle' },
            }),
            -- markdown
            formatting.prettier.with({ filetypes = { 'markdown' } }),
            diagnostics.vale,
            code_actions.proselint,
            -- diagnostics.markdownlint,
            -- hover.dictionary,
            -- python
            formatting.black,
            diagnostics.flake8,
        },
    })
end

return M
