vim.cmd([[
    augroup _indentations
        autocmd!
        autocmd Filetype html,css,json,javascript,javascriptreact,typescript,typescriptreact 
                \ setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
    augroup end

    augroup _markdown
        autocmd!
        autocmd Filetype markdown setlocal wrap
    augroup end
]])
