local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap =
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    print('Installing packer close and reopen Neovim...')
    vim.cmd([[packadd packer.nvim]])
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
            return require('packer.util').float({ border = 'rounded' })
        end,
    },
})

-- Installed plugins
return packer.startup(function(use)
    use('wbthomason/packer.nvim') -- Have packer manage itself

    -- Dependencies
    use('nvim-lua/popup.nvim') -- An implementation of the Popup API from vim in Neovim
    use('nvim-lua/plenary.nvim') -- Useful lua functions used ny lots of plugins
    use('kyazdani42/nvim-web-devicons') -- Add web devicons to nvim
    use('moll/vim-bbye')

    -- Misc
    use('numToStr/Comment.nvim') -- Easily comment stuff
    use('danymat/neogen')
    use('lewis6991/impatient.nvim')
    use('makerj/vim-pdf')
    use({
        'xeluxee/competitest.nvim',
        requires = 'MunifTanjim/nui.nvim',
    })
    use({ 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' })

    -- UI
    use('ellisonleao/gruvbox.nvim') -- Gruvbox colorscheme
    use('kyazdani42/nvim-tree.lua') -- Tree view of directory structure
    use('akinsho/bufferline.nvim') -- Buffer line
    use('nvim-lualine/lualine.nvim')
    use('RRethy/vim-illuminate')
    use({
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end,
    })
    use('rcarriga/nvim-notify')
    -- use { 'vimpostor/vim-tpipeline',
    --     config = 'vim.g.tpipeline_cursormoved = 1',
    -- }

    -- Completion
    use('github/copilot.vim')
    use('hrsh7th/nvim-cmp') -- The completion plugin
    use('hrsh7th/cmp-buffer') -- Buffer completions
    use('hrsh7th/cmp-path') -- Path completions
    use('hrsh7th/cmp-cmdline') -- Cmdline completions
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-nvim-lua')
    use('saadparwaiz1/cmp_luasnip') -- Snippet completions
    use('onsails/lspkind.nvim') -- Colored icons for cmp

    -- Snippets
    use('L3MON4D3/LuaSnip') -- Snippet engine
    use('rafamadriz/friendly-snippets') -- A bunch of snippets to use

    -- LSP
    use('neovim/nvim-lspconfig') -- Enable LSP
    use('williamboman/nvim-lsp-installer') -- Simple to use language server installer
    use('tamago324/nlsp-settings.nvim')
    -- FIXME: the next commit refactors using the nvim RPC, don't know why it doesn't work
    -- @see https://github.com/jose-elias-alvarez/null-ls.nvim/commit/43cf6d732b4e7e550ce8f9f46570e5eb25a19025
    use({ 'jose-elias-alvarez/null-ls.nvim', commit = '76d0573fc159839a9c4e62a0ac4f1046845cdd50' })
    -- use 'simrat39/symbols-outline.nvim'

    -- Telescope
    use('nvim-telescope/telescope.nvim')
    use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })

    -- Treesitter
    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    })
    use('JoosepAlviste/nvim-ts-context-commentstring')
    use('windwp/nvim-autopairs')
    use('windwp/nvim-ts-autotag')

    -- Git
    use('lewis6991/gitsigns.nvim')
    -- TODO: remove vim-fugitive
    use('tpope/vim-fugitive')

    -- Debugging
    use({ 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } })

    -- Tpope
    use('tpope/vim-surround')
    use('tpope/vim-repeat')

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        packer.sync()
    end
end)
