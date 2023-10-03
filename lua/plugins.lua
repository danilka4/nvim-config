local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
    'windwp/nvim-autopairs',

    'tpope/vim-fugitive',      -- OP git stuff
    'akinsho/toggleterm.nvim', -- For lazygit

    -- Color
    'sainnhe/everforest',
    'norcalli/nvim-colorizer.lua',

    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    'nvim-treesitter/playground',

    --'danilka4/ts_r',
    { dir = '~/Documents/nvim/ts_r/' },

    {
        'unblevable/quick-scope',
        keys = { 'f', 'F', 't', 'T' }
    }, -- Makes f/t better

    -- Auto-completion engine
    -- NOTE: This is where your plugins related to LSP can be installed.
    --  The configuration is done below. Search for lspconfig to find it below.
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            'neovim/nvim-lspconfig',
            {
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end
            },
            'williamboman/mason-lspconfig.nvim',
            -- Automatically install LSPs to stdpath for neovim

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            --{ 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing!
            --'folke/neodev.nvim',
            'hrsh7th/nvim-cmp',
            'SirVer/ultisnips', -- Snippets
            'quangnguyen30192/cmp-nvim-ultisnips',

            -- Adds LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp',

            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'uga-rosa/cmp-dictionary',
        }
    },
    -- Discord integration
    'andweeb/presence.nvim',

    {'nvim-lua/lsp-status.nvim', -- Adds LSP to lualine
        dependencies = {
            'neovim/nvim-lspconfig',
            'nvim-lualine/lualine.nvim'
        }
    },


    -- Telescope
    { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

    {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
            return vim.fn.executable 'make' == 1
        end,
    },
    'nvim-lualine/lualine.nvim',
    -- If you want to have icons in your statusline choose one of these
    'kyazdani42/nvim-web-devicons',

    -- Snips
    --	'honza/vim-snippets',

    -- Tests startup time
    'dstein64/vim-startuptime',

    -- Vim Wiki
    {'vimwiki/vimwiki',
        init = function ()
            vim.g.vimwiki_list = {{path = '~/Documents/theory/wiki/', syntax = 'markdown', ext = '.md'}}
        end
    },

    -- Better file navigation
    'stevearc/oil.nvim',

    --Plug 'jiangmiao/auto-pairs'
    {
    'goolord/alpha-nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
};
})
