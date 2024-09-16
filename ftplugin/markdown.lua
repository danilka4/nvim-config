vim.opt.spell = true
vim.opt.spelllang='en_us'
vim.cmd("set spellsuggest+=20")
vim.cmd("UltiSnipsAddFiletypes markdown")

local function colon()
    vim.cmd("normal! $")
    return vim.fn.expand('<cword>') == ':'
end
vim.keymap.set("i", "<CR>", function()
    if vim.fn.col(".") ~= vim.fn.col("$") then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<c-j>", true, true, true))
        return
    end
    local has_colon = colon()
    vim.cmd("normal! ^")
    local cword = vim.fn.expand('<cWORD>')
    if cword == "*" or cword == "-" then
        vim.cmd("normal! o* ")
    else
        vim.cmd("normal! o")
    end
    if has_colon then
        vim.cmd("normal! >>")
    end
    vim.cmd('startinsert!')
end, {noremap=true})

vim.keymap.set("n", "o", function()
    local has_colon = colon()
    vim.cmd("normal! ^")
    local cword = vim.fn.expand('<cWORD>')
    if cword == "*" or cword == "-" then
        vim.cmd("normal! o* ")
    else
        vim.cmd("normal! o")
    end
    if has_colon then
        vim.cmd("normal! >>")
    end
    vim.cmd('startinsert!')
end)

vim.keymap.set("n", "O", function()
    vim.cmd("normal! ^")
    local cword = vim.fn.expand('<cWORD>')
    if cword == "*" or cword == "-" then
        vim.cmd("normal! O* ")
    else
        vim.cmd("normal! O")
    end
    vim.cmd('startinsert!')
end)

vim.keymap.set("n", "<leader>od", ":ObsidianTemplate default.md<CR>")
vim.keymap.set("n", "<leader>ob", ":ObsidianBacklinks<CR>")
vim.keymap.set("n", "<leader>of", function ()
    local value = vim.inspect(vim.opt.colorcolumn:get())
    if value == "{}" then
        vim.opt.colorcolumn = "100"
        vim.wo.wrap = false
    else
        vim.opt.colorcolumn = {}
        vim.wo.wrap = true
    end
end)
vim.keymap.set("n", "<leader>og", function ()
    vim.fn.jobstart("obsidian")
end)
vim.keymap.set("n", "<leader>ot", ":split ~/Documents/theory/wiki/todo.md<CR>")
vim.keymap.set("n", "<leader>ow", "/#<CR>:nohlsearch<CR>jVGg<c-g>")

vim.keymap.set("v", "<leader>ol", ":ObsidianLinkNew<CR>")

local function getWords()
    return tostring(vim.fn.wordcount().words - 12)
end
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'everforest',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', getWords, 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
}
