require('telescope').setup{
  defaults = {
      file_ignore_patterns = {"csv$", "stx$", "bil$"},
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
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
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                         -- the default case_mode is "smart_case"
      }    
      -- Your extension configuration goes here:
      -- extension_name = {
      --   extension_config_key = value,
      -- }
      -- please take a look at the readme of the extension you want to configure
  }
}
