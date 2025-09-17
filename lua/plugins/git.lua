return {
    {
        "tpope/vim-fugitive",
        config = function()
            -- vim.keymap.set("n", "<leader>ga", ":Git add %<CR>", { desc = "Git add current file" })
            vim.keymap.set("n", "<leader>ga", ":Git add -A<CR>", { desc = "Git add and commit all files" })
            vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Git add and commit all files" })
            vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Git push" })
            -- vim.keymap.set("n", "<leader>gc", ":Git commit --no-verify<CR>", { desc = "Git commit" })
        end
    },
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require 'toggleterm'.setup {}

            local Terminal = require("toggleterm.terminal").Terminal
            local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, dir = "git_dir", direction = "float" })

            function _lazygit_toggle()
                lazygit:toggle()
            end

            vim.keymap.set("n", "<leader>G", "<cmd>lua _lazygit_toggle()<CR>")
        end
    }, -- For lazygit
}
