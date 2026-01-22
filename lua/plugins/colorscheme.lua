return {
    {
        'sainnhe/everforest',
        config = function()
            vim.g.everforest_transparent_background = 2
            vim.g.everforest_ui_contrast = 'high'
            vim.g.everforest_better_performance = 1
            vim.g.everforest_float_style = 'blend'
            vim.cmd.colorscheme("everforest")

            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            --vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
        end
    },
    { 'norcalli/nvim-colorizer.lua',
        -- config = function ()
        --     RRGGBBAA = true
        -- end
    },
}
