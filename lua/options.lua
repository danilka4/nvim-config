local options = {
    number = true,
    relativenumber = true,
    clipboard = "unnamedplus",
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    expandtab = true,
    smartindent = true,
    so = 5,
    wildmenu = true,
    lazyredraw = true,
    splitbelow = true,
    splitright = true,
    syntax = "on",
    termguicolors = true,
    showcmd = true,
    undofile = true,
    incsearch = true,           -- Highlight all as you type
    ignorecase = true,          -- Ignore case
    smartcase = true,           -- Don't ignore uppercase
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
