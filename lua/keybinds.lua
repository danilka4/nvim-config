local silent = { silent = true }

local vim = vim

-- sets leader to space
vim.g.mapleader = " "

-- Saves in insert mode
vim.keymap.set('i', '<c-s>', '<esc>:w<cr>a')

-- Records tea in insert mode
-- vim.keymap.set('i', '<c-t>', '<esc>:!tea<cr>a')

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


vim.keymap.set("n", "<C-S-Up>", require('smart-splits').resize_up)
vim.keymap.set("n", "<C-S-Down>", require('smart-splits').resize_down)
vim.keymap.set("n", "<C-S-Left>", require('smart-splits').resize_left)
vim.keymap.set("n", "<C-S-Right>", require('smart-splits').resize_right)

-- <c-vim arrows> switches screen in terminal mode
vim.keymap.set('t', '<c-j>', '<c-\\><c-n><c-w>j')
vim.keymap.set('t', '<c-k>', '<c-\\><c-n><c-w>k')
vim.keymap.set('t', '<c-h>', '<c-\\><c-n><c-w>h')
vim.keymap.set('t', '<c-l>', '<c-\\><c-n><c-w>l')

vim.keymap.set('n', '<Leader>ff', "<Cmd> lua require('telescope.builtin').find_files( { cwd = vim.fn.expand('%:p:h') })<cr>")

vim.keymap.set('n', '<Leader>fF', '<Cmd>lua require("telescope.builtin").find_files({cwd="/home/lizzy"})<cr>')
vim.keymap.set('n', '<Leader>fg', '<Cmd>Telescope git_files<cr>')
vim.keymap.set('n', '<Leader>fb', '<Cmd>lua require("telescope.builtin").live_grep({cwd="/home/lizzy/Documents/latex/", glob_pattern="sources.bib", disable_coordinates=true, use_regex=true, default_text="@.*\\\\{",path_display = function() return "" end})<cr>')
vim.keymap.set('n', '<Leader>fw', '<Cmd>lua require("telescope.builtin").live_grep()<cr>')
vim.keymap.set('n', '<Leader>fG', function ()
    local handle = io.popen('git rev-parse --show-toplevel');
    if handle == nil then
        error("Couldn't get handle for some reason")
    end
    local output = handle:read('*a')
    local git_dir = output:gsub('[\n\r]', '')
    handle:close()
    -- If not in git repo
    if git_dir == "" then
        error("Not in git repository")
    else
        require("telescope.builtin").live_grep({cwd=git_dir})
    end
end)

-- local ts_r = require('ts_r')
-- vim.api.nvim_create_autocmd({'VimEnter'}, {
--     pattern = {"*.r", "*.rmd"},
--     callback = function() ts_r.open_term() end,
-- })

require'toggleterm'.setup{}

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({cmd = "lazygit", hidden = true, dir="git_dir",direction = "float"})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.keymap.set("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>")
-- vim.keymap.set("i", "]]", "a<Esc>r'a")

-- vim.keymap.set("n", "<leader>wq", "<c-w>s:e ~/Documents/theory/wiki/index.md<CR>")

-- Sets keymap to go to wiki
vim.keymap.set("n", "<leader>ww", ":e ~/Documents/theory/wiki/index.md<CR>")

-- Opens up oil
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

-- Switch buffers
vim.keymap.set("n", "]b", "<cmd>bnext<CR>")
vim.keymap.set("n", "[b", "<cmd>bprevious<CR>")

-- Quickfix shenanigans
vim.keymap.set("n", "]q", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "[q", "<cmd>cprevious<CR>zz")
vim.keymap.set("n", "]l", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "[l", "<cmd>lprevious<CR>zz")
vim.keymap.set("n", "<leader>m", "<cmd>make<cr>")

vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
-- vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
--   {silent = true, noremap = true}
-- )

-- Comment keybinds
vim.keymap.set("n", "<leader>/", "gcc", {remap = true})
vim.keymap.set("v", "<leader>/", "gcgv", {remap = true})
