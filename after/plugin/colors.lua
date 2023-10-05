vim.cmd("let g:everforest_transparent_background=2")
vim.cmd("let g:everforest_ui_contrast = 'high'")
vim.cmd("let g:everforest_better_performance = 1")
vim.cmd("let g:everforest_float_style = 'none'")
vim.cmd.colorscheme("everforest")

vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

require('colorizer').setup({ '*' }, {
    RRGGBBAA = true,
})

