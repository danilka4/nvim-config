return {

    -- Trouble for quickfix
    {'williamboman/mason.nvim',
        config = function ()
            require("mason").setup()
        end
    },
    'folke/trouble.nvim',
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },

    -- 'nvim-lualine/lualine.nvim',
    -- If you want to have icons in your statusline choose one of these
    'kyazdani42/nvim-web-devicons',
}
