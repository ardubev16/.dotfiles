local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup({
    ensure_installed = 'all', -- A list of parser names, or 'all'
    sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
    ignore_install = { '' }, -- List of parsers to ignore installing (for "all")
    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        disable = { '' },

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    autopairs = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
    -- indent = { enable = true, disable = { 'yaml' } },
    indent = { enable = true },

    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    -- TODO: find more extensions
})
