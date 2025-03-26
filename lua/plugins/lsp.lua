return {
    {
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
                --'kkharji/sqlite.lua', -- For better dictionary
            }
        },
        'nvim-lua/lsp-status.nvim', -- Adds LSP to lualine
        dependencies = {
            'neovim/nvim-lspconfig',
            'nvim-lualine/lualine.nvim'
        }
    },
}
