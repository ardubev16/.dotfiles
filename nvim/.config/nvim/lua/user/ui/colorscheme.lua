local colorscheme = 'gruvbox'
vim.opt.background = 'dark'
vim.g.gruvbox_contrast_dark = 'medium'
vim.g.gruvbox_italic = true
vim.g.gruvbox_underline = false

local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
    vim.notify('Colorscheme ' .. colorscheme .. ' not found!')
    return
end
