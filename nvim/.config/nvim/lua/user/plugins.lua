local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    --  print("Installing packer close and reopen Neovim...")
    --  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require('packer.util').float { border = 'rounded' }
        end,
    },
})

-- Installed plugins
return packer.startup(function(use)
    -- Misc
    use 'wbthomason/packer.nvim' -- Have packer manage itself
    use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in Neovim
    use 'nvim-lua/plenary.nvim' -- Useful lua functions used ny lots of plugins
    use 'windwp/nvim-autopairs' -- Autopairs, integrates with both cmp and treesitter
    use 'numToStr/Comment.nvim' -- Easily comment stuff

    -- Themes
    use 'gruvbox-community/gruvbox'
    use 'vim-airline/vim-airline'

    -- Completion
    use 'github/copilot.vim'
    use 'hrsh7th/nvim-cmp' -- The completion plugin
    use 'hrsh7th/cmp-buffer' -- Buffer completions
    use 'hrsh7th/cmp-path' -- Path completions
    use 'hrsh7th/cmp-cmdline' -- Cmdline completions
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'saadparwaiz1/cmp_luasnip' -- Snippet completions
    use 'onsails/lspkind.nvim' -- Colored icons for cmp

    -- Snippets
    use 'L3MON4D3/LuaSnip' -- Snippet engine
    use 'rafamadriz/friendly-snippets' -- A bunch of snippets to use

    -- LSP
    use 'neovim/nvim-lspconfig' -- Enable LSP
    use 'williamboman/nvim-lsp-installer' -- Simple to use language server installer

    -- Telescope
    use 'nvim-telescope/telescope.nvim'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'p00f/nvim-ts-rainbow'

    -- Git
    use 'lewis6991/gitsigns.nvim'
    use 'tpope/vim-fugitive'

    -- Tpope
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'tpope/vim-obsession'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        packer.sync()
    end
end)
