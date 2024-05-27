local function colon()
    vim.cmd("normal! $")
    return vim.fn.expand('<cword>') == ':'
end
vim.keymap.set("n", "<leader>wh", ":ObsidianTemplate default.md<CR>")
vim.keymap.set("i", "<CR>", function()
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
