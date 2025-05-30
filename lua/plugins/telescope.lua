return {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        setup = function()
            local actions = require "telescope.actions"
            require('telescope').setup {
                defaults = {
                    file_ignore_patterns = { "stx$", "bil$" },
                    -- Default configuration for telescope goes here:
                    -- config_key = value,
                    mappings = {
                        i = {
                            -- map actions.which_key to <C-h> (default: <C-/>)
                            -- actions.which_key shows the mappings for your picker,
                            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                            ["<C-s>"] = actions.select_horizontal,
                        }
                    }
                },
                pickers = {
                    find_files = {
                        mappings = {
                            i = {
                                ["<cr>"] = function(prompt_bufnr)
                                    local selection = require("telescope.actions.state").get_selected_entry()
                                    local dir = vim.fn.fnamemodify(selection.path, ":p:h")
                                    require("telescope.actions").close(prompt_bufnr)
                                    -- Depending on what you want put `cd`, `lcd`, `tcd`
                                    vim.cmd(string.format("silent lcd %s", dir))
                                    vim.cmd(string.format("silent edit %s", selection.path))
                                end,
                                ["<c-d>"] = function(prompt_bufnr)
                                    local selection = require("telescope.actions.state").get_selected_entry()
                                    local dir = vim.fn.fnamemodify(selection.path, ":p:h")
                                    require("telescope.actions").close(prompt_bufnr)
                                    -- Depending on what you want put `cd`, `lcd`, `tcd`
                                    vim.cmd(string.format("silent lcd %s", dir))
                                end
                            }
                        }
                    },
                    --live_grep = {
                    --  -- your defaults for live_grep
                    --    additional_args = function(opts)
                    --        if opts.search_all == true then
                    --            return {}
                    --        end

                    --        local args_for_ext = {
                    --            ["cs"]  = "-tcs",
                    --            ["cpp"] = "-tcpp",
                    --            ["c"]   = "-tcpp",
                    --            ["h"]   = "-tcpp",
                    --            ["rs"]  = "-trust",
                    --            ["lua"] = "-tlua",
                    --            ["bib"] = "-tbib"
                    --        }
                    --        return { args_for_ext[vim.bo.filetype] }
                    --    end
                    --}
                    -- Default configuration for builtin pickers goes here:
                    -- picker_name = {
                    --   picker_config_key = value,
                    --   ...
                    -- }
                    -- Now the picker_config_key will be applied every time you call this
                    -- builtin picker
                },
                extensions = {
                    fzf = {
                        fuzzy = true,     -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    }
                    -- Your extension configuration goes here:
                    -- extension_name = {
                    --   extension_config_key = value,
                    -- }
                    -- please take a look at the readme of the extension you want to configure
                }
            }
        end
    },

    {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
            return vim.fn.executable 'make' == 1
        end,
    },
}
