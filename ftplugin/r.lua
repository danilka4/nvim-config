local vim = vim
local ts_r = require('ts_r')
vim.keymap.set('n', '<leader>r', function() ts_r.open_term() end)
vim.keymap.set('n', '<leader>q', function() ts_r.close_term() end)
vim.keymap.set('n', '<leader>l', function() ts_r.send_line() end)
vim.keymap.set('v', '<leader>s', function() ts_r.send_selection() end)
vim.keymap.set('n', 'K', function() ts_r.man_entry() end)
vim.keymap.set('n', '<leader>ip', function() ts_r.install_package() end)
vim.keymap.set('n', '<leader>ig', function() ts_r.install_git() end)
vim.keymap.set('n', '<leader>is', function() ts_r.save_image() end)
vim.keymap.set('n', '<leader>a', function() ts_r.send_all() end)
vim.api.nvim_create_autocmd({'VimEnter'}, {
    --pattern = {"*.r", "*.rmd"},
    callback = function() ts_r.open_term() end,
})

vim.keymap.set('i', ';a', ' <- ')
vim.keymap.set('i', ';s', ' %>%')
