local silent = { silent = true }

local vim = vim

-- sets leader to space
vim.g.mapleader = " "

-- Saves in insert mode
vim.keymap.set('i', '<c-s>', '<esc>:w<cr>a')

-- Records tea in insert mode
vim.keymap.set('i', '<c-t>', '<esc>:!tea<cr>a')

-- Opens vimrc
vim.keymap.set('n', '<leader>ev', ':vsplit $MYVIMRC<cr>')

-- <c-vim arrows> switches screen
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-l>', '<c-w>l')

-- No arrow keys for me
vim.keymap.set("n", "<Up>", "<nop>")
vim.keymap.set("n", "<Down>", "<nop>")
vim.keymap.set("n", "<Left>", "<nop>")
vim.keymap.set("n", "<Right>", "<nop>")


vim.keymap.set("n", "<C-S-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-S-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-S-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-S-Right>", ":vertical resize +2<CR>")

-- <c-vim arrows> switches screen in terminal mode
vim.keymap.set('t', '<c-j>', '<c-\\><c-n><c-w>j')
vim.keymap.set('t', '<c-k>', '<c-\\><c-n><c-w>k')
vim.keymap.set('t', '<c-h>', '<c-\\><c-n><c-w>h')
vim.keymap.set('t', '<c-l>', '<c-\\><c-n><c-w>l')

vim.keymap.set('n', '<Leader>ff', "<Cmd> lua require('telescope.builtin').find_files( { cwd = vim.fn.expand('%:p:h') })<cr>")

vim.keymap.set('n', '<Leader>fF', '<Cmd>lua require("telescope.builtin").find_files({cwd="/home/lizzy"})<cr>')
vim.keymap.set('n', '<Leader>fg', '<Cmd>Telescope git_files<cr>')
vim.keymap.set('n', '<Leader>fb', '<Cmd>lua require("telescope.builtin").live_grep({cwd="/home/lizzy/Documents/latex/", glob_pattern="sources.bib", disable_coordinates=true, use_regex=true, default_text="@.*\\\\{",path_display = function() return "" end})<cr>')
vim.keymap.set('n', '<Leader>fw', '<Cmd>lua require("telescope.builtin").live_grep({cwd="/home/lizzy/Documents/theory/", glob_pattern="*.md", use_regex=true})<cr>')

local ts_r = require('ts_r')
vim.api.nvim_create_autocmd({'VimEnter'}, {
    pattern = {"*.r", "*.rmd"},
    callback = function() ts_r.open_term() end,
})

require'toggleterm'.setup{}

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({cmd = "lazygit", hidden = true, direction = "float"})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.keymap.set("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>")
vim.keymap.set("i", "]]", "a<Esc>r'a")

vim.keymap.set("n", "<leader>wq", "<c-w>s:e ~/Documents/theory/wiki/index.md<CR>")

-- Opens up oil
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

-- Shift tab thingy
vim.keymap.set("i", '<S-Tab>', '<c-d>')
