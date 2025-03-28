-- require("lazy").setup({
    -- 'windwp/nvim-autopairs',

    -- 'tpope/vim-fugitive',      -- OP git stuff
    -- 'akinsho/toggleterm.nvim', -- For lazygit

    -- Color
    -- 'sainnhe/everforest',
    -- 'norcalli/nvim-colorizer.lua',

    -- { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    -- 'nvim-treesitter/playground',

    --'danilka4/ts_r',
    -- { dir = '~/Documents/nvim/ts_r/' },

    -- {
    --     'unblevable/quick-scope',
    --     keys = { 'f', 'F', 't', 'T' }
    -- }, -- Makes f/t better

    -- Auto-completion engine
    -- NOTE: This is where your plugins related to LSP can be installed.
    --  The configuration is done below. Search for lspconfig to find it below.
    --{
    --    'VonHeikemen/lsp-zero.nvim',
    --    branch = 'v2.x',
    --    dependencies = {
    --        'neovim/nvim-lspconfig',
    --        {
    --            'williamboman/mason.nvim',
    --            build = function()
    --                pcall(vim.cmd, 'MasonUpdate')
    --            end
    --        },
    --        'williamboman/mason-lspconfig.nvim',
    --        -- Automatically install LSPs to stdpath for neovim

    --        -- Useful status updates for LSP
    --        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    --        --{ 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

    --        -- Additional lua configuration, makes nvim stuff amazing!
    --        --'folke/neodev.nvim',
    --        'hrsh7th/nvim-cmp',
    --        'SirVer/ultisnips', -- Snippets
    --        'quangnguyen30192/cmp-nvim-ultisnips',

    --        -- Adds LSP completion capabilities
    --        'hrsh7th/cmp-nvim-lsp',

    --        'hrsh7th/cmp-buffer',
    --        'hrsh7th/cmp-path',
    --        'hrsh7th/cmp-cmdline',
    --        'uga-rosa/cmp-dictionary',
    --        --'kkharji/sqlite.lua', -- For better dictionary
    --    }
    --},
    --{
    --    "nvimtools/none-ls.nvim",
    --    dependencies = {
    --        "nvimtools/none-ls-extras.nvim",
    --    },
    --},
    -- {
    -- 'f3fora/nvim-texlabconfig',
    -- config = function()
    --     local config = {
    --         cache_activate = true,
    --         cache_filetypes = { 'tex', 'bib' },
    --         cache_root = vim.fn.stdpath('cache'),
    --         reverse_search_start_cmd = function()
    --             return true
    --         end,
    --         reverse_search_edit_cmd = vim.cmd.edit,
    --         reverse_search_end_cmd = function()
    --             return true
    --         end,
    --         file_permission_mode = 438,
    --     }
    --     require('texlabconfig').setup(config)
    -- end,
    -- -- ft = { 'tex', 'bib' }, -- Lazy-load on filetype
    -- build = 'go build'
    -- -- build = 'go build -o ~/.bin/' if e.g. ~/.bin/ is in $PATH
    -- },
    -- Discord integration
    -- {
    --     'andweeb/presence.nvim',
    --     config = function()
    --         require("presence").setup({
    --             auto_update         = true,
    --             neovim_image_text   = "I'm not stuck in vim. Vim is stuck around me",
    --             -- log_level           = "debug",
    --             debounce_timeout    = 10,
    --             enable_line_number  = false,
    --             buttons             = false,
    --             show_time           = true,
    --             -- Rich Presence text options
    --             editing_text        = "Editing %s",
    --             file_explorer_text  = "Browsing %s",
    --             git_commit_text     = "Committing changes",
    --             plugin_manager_text = "Managing plugins",
    --             reading_text        = "Reading %s",
    --             workspace_text      = "Working on %s",
    --             line_number_text    = "Line %s out of %s"
    --         })
    --     end
    -- },

    -- {
    --     'nvim-lua/lsp-status.nvim', -- Adds LSP to lualine
    --     dependencies = {
    --         'neovim/nvim-lspconfig',
    --         'nvim-lualine/lualine.nvim'
    --     }
    -- },


    -- Telescope
    -- { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

    -- {
    --     'nvim-telescope/telescope-fzf-native.nvim',
    --     -- NOTE: If you are having trouble with this installation,
    --     --       refer to the README for telescope-fzf-native for more instructions.
    --     build = 'make',
    --     cond = function()
    --         return vim.fn.executable 'make' == 1
    --     end,
    -- },

    ---- Harpoon
    --'theprimeagen/harpoon',

    ---- Trouble for quickfix
    --'folke/trouble.nvim',
    --{
    --    "folke/todo-comments.nvim",
    --    dependencies = { "nvim-lua/plenary.nvim" },
    --    opts = {
    --        -- your configuration comes here
    --        -- or leave it empty to use the default settings
    --        -- refer to the configuration section below
    --    }
    --},

    ---- 'nvim-lualine/lualine.nvim',
    ---- If you want to have icons in your statusline choose one of these
    --'kyazdani42/nvim-web-devicons',

    -- Snips
    --	'honza/vim-snippets',

    -- Tests startup time
    -- 'dstein64/vim-startuptime',


    --{
    --    "epwalsh/obsidian.nvim",
    --    version = "*",
    --    lazy = true,
    --    ft = "markdown",
    --    dependencies = {
    --        "nvim-lua/plenary.nvim",
    --    },

    --    opts = {
    --        workspaces = {
    --            {
    --                name = "personal",
    --                path = "~/Documents/theory/",
    --                -- Optional, override certain settings.
    --                overrides = {
    --                    notes_subdir = "web",
    --                },
    --            },
    --        },
    --        new_notes_location = "notes_subdir",

    --        wiki_link_func = function(opts)
    --            return require("obsidian.util").wiki_link_path_prefix(opts)
    --        end,
    --        -- completion = {
    --        --     prepend_note_path = true,
    --        --     use_path_only = true
    --        -- },
    --        note_id_func = function(title)
    --            return title:lower()
    --            --:gsub(" ", "_")
    --        end,
    --        note_frontmatter_func = function(note)
    --            -- Add the title of the note as an alias.
    --            -- if note.title then
    --            --     note:add_alias(note.title)
    --            -- end

    --            local out = { id = note.id, aliases = note.aliases, tags = note.tags }
    --            if #note.tags == 0 then
    --                table.insert(out.tags, "wip")
    --            end

    --            -- `note.metadata` contains any manually added fields in the frontmatter.
    --            -- So here we just make sure those fields are kept in the frontmatter.
    --            if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
    --                for k, v in pairs(note.metadata) do
    --                    out[k] = v
    --                end
    --            end

    --            return out
    --        end,
    --        follow_url_func = function(url)
    --            if url:sub(1, 8) == "file:///" then
    --                local formatted = url:sub(9, -1)
    --                print(formatted)
    --                vim.cmd("edit " .. formatted)
    --            else
    --                print(url)
    --                vim.fn.jobstart({ "xdg-open", url }) -- linux
    --            end
    --        end,
    --        completion = {
    --            -- Set to false to disable completion.
    --            nvim_cmp = true,
    --            -- Trigger completion at 2 chars.
    --            min_chars = 2,
    --        },


    --        templates = {
    --            subdir = "templates",
    --            date_format = "%Y-%m-%d-%a",
    --            time_format = "%H:%M",
    --        },
    --        mappings = {
    --            ["<CR>"] = {
    --                action = function()
    --                    return require("obsidian").util.gf_passthrough()
    --                end,
    --                opts = { noremap = false, expr = true, buffer = true },
    --            },
    --        },
    --    },
    --},

    -- Better file navigation
    -- 'stevearc/oil.nvim',

    --Plug 'jiangmiao/auto-pairs'
    -- {
    --     'goolord/alpha-nvim',
    --     dependencies = { 'kyazdani42/nvim-web-devicons' },
    --     config = function()
    --         require 'alpha'.setup(require 'alpha.themes.startify'.config)
    --     end
    -- },
    -- 'tpope/vim-commentary',

    -- { 'mrjones2014/smart-splits.nvim' }, -- Makes split size change go in direction you want


    -- 'jpmcb/nvim-llama',
    -- {
    --     "ptdewey/pendulum-nvim",
    --     config = function()
    --         require("pendulum").setup()
    --     end,
    -- },

    -- {
    --     'jakewvincent/mkdnflow.nvim',
    --     config = function()
    --         require('mkdnflow').setup({
    --             -- Config goes here; leave blank for defaults
    --             links = {
    --                 style='wiki',
    --                 conceal=true,
    --             },
    --             bib = {
    --                 default_path = "/home/lizzy/Documents/latex/sources.bib"
    --             }
    --         })
    --     end
    -- },

-- })
