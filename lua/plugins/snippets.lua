local char = "'"
return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
        event = "InsertEnter",

        config = function()
            local ls = require("luasnip")

            -- plugin setup
            ls.setup({
                -- load snippets defined for other languages
                -- TODO: fix this
                load_ft_func = require("luasnip.extras.filetype_functions").extend_load_ft({
                    markdown = { "c", "cuda", "tex" },
                    rmd = { "r", "tex" },
                    cuda = { "c" },
                }),
            })
            -- keymaps for navigating editable regions
            -- jump down
            vim.keymap.set({ "i", "s" }, char, function()
                    ls.jump(1)
            end, { silent = true })

            -- jump up
            vim.keymap.set({ "i", "s" }, "//", function()
                    ls.jump(-1)
            end, { silent = true })

            -- cycle choices
            vim.keymap.set({ "i", "s" }, "<c-j>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, { silent = true })
    end
}
