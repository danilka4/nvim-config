return {
    { "tpope/vim-fugitive" },
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require 'toggleterm'.setup {}

            local Terminal = require("toggleterm.terminal").Terminal
            local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, dir = "git_dir", direction = "float" })

            function _lazygit_toggle()
                lazygit:toggle()
            end

            vim.keymap.set("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>")
        end
    }, -- For lazygit
}
