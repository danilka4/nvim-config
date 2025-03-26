vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
require "options"
--require "plugins"
require "lazy-nvim"
require "keybinds"
vim.cmd('source ~/.config/nvim/lua/vim_stuff.vim')

vim.lsp.config('*', {
  capabilities = {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      }
    }
  },
  root_markers = { '.git' },
})

local configs = {}

for _, v in ipairs(vim.api.nvim_get_runtime_file('lsp/*', true)) do 
  local name = vim.fn.fnamemodify(v, ':t:r')
  configs[name] = true
end

vim.lsp.enable(vim.tbl_keys(configs))
