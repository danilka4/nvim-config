vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
require "options"
--require "plugins"
require "lazy-nvim"
require "keybinds"
vim.cmd('source ~/.config/nvim/lua/vim_stuff.vim')
