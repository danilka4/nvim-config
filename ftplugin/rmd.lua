local ts_r = require('ts_r')
vim.cmd.source("~/.config/nvim/ftplugin/r.lua")
vim.keymap.set('n', '<leader>c', function() ts_r.send_chunk() end)
vim.keymap.set('n', ']c', function() ts_r.move_chunk_down() end)
vim.keymap.set('n', '[c', function() ts_r.move_chunk_up() end)
vim.keymap.set('n', '<leader>dk', function() ts_r.knit_doc() end)

vim.opt.conceallevel = 0
