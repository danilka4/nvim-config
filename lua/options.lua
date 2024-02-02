local options = {
    number = true,
    relativenumber = true,
    clipboard = "unnamedplus",
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    expandtab = true,
    smartindent = true,
    so = 5, -- Start scrolling 5 rows from the top/bottom
    wildmenu = true,
    lazyredraw = true,
    splitbelow = true,
    splitright = true,
    syntax = "on",
    termguicolors = true,                    -- Pretty colors
    showcmd = true,
    undofile = true,                         -- Keeps track of undos between sessions
    incsearch = true,                        -- Highlight all as you type
    ignorecase = true,                       -- Ignore case
    smartcase = true,                        -- Don't ignore uppercase
    --foldcolumn = "1",                       -- Creates column for folds
    -- foldmethod = "expr",                     -- The fold method is custom
    -- foldexpr = "nvim_treesitter#foldexpr()", -- The method of folding is treesitter
    conceallevel = 2,
}
vim.cmd("au BufRead * normal zR")
for k, v in pairs(options) do
    vim.opt[k] = v
end
