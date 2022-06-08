local options = {
    backup = false, -- no backup
    colorcolumn = '80', -- column number for color column
    completeopt = { 'menu', 'menuone', 'noselect' }, -- completeopt
    conceallevel = 0, -- no conceal
    cursorline = true, -- show cursor line
    errorbells = false, -- no error bell
    expandtab = true, -- expand tab
    guicursor = '', -- show cursor
    hidden = true, -- hide buffer
    hlsearch = false, -- no highlight search
    ignorecase = true, -- ignore case
    incsearch = true, -- incremental search
    number = true, -- show line number
    relativenumber = true, -- show relative line number
    scrolloff = 8, -- scroll offset
    shiftwidth = 4, -- shiftwidth
    showcmd = true, -- show command in status line
    showmode = false, -- no show mode
    -- showtabline = 2, -- show tabline
    sidescrolloff = 8, -- side scroll offset
    signcolumn = 'yes', -- show sign column
    smartindent = true, -- smart indent
    softtabstop = 4, -- soft tabstop
    swapfile = false, -- no swap file
    tabstop = 4, -- tabstop
    termguicolors = true, -- use terminal colors
    undofile = true, -- undo file
    wildmenu = true, -- show wildmenu
    wrap = false, -- no wrap
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd([[set iskeyword+=-]])
