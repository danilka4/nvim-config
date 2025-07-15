return {
    {
        'stevearc/oil.nvim',
        config = function()
            require("oil").setup({
                view_options = {
                    is_always_hidden = function(name, bufnr)
                        local ignore = { "fls", "xml", "fdb_latexmk", "bbl", "bcf", "blg", "nav", "out", "snm", "toc" }
                        for _, v in pairs(ignore) do
                            if vim.endswith(name, v) then
                                return true
                            end
                        end
                        return false
                    end,
                },
                keymaps = {
                    ['-'] = { "actions.parent", mode = "n" },
                    ['g?'] = { "actions.show_help", mode = "n" },
                    ["<CR>"] = "actions.select",
                },
                use_default_keymaps=false,
            })
        end
    }
}
