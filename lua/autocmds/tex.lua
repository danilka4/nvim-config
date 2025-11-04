vim.api.nvim_create_autocmd("VimLeave", {
    -- This autocommand will only trigger if the buffer name matches the following patterns
    pattern = { "*.tex", "*.md" },
    command = "!pkill latexmk; rm /home/lizzy/Documents/theory/essays/dissertation/temp/* ; latexmk -c ",
    -- The autocommand will trigger the following lua function
})

local function write()
    local first_line = vim.fn.getline(1)
    local directory = vim.fn.expand('%:p:h')
    local file = vim.fn.expand('%')
    if directory == "/home/lizzy/Documents/theory/essays/dissertation" then
        -- vim.print("Test")
        return { 'latexmk',
            '-pdf',
            '-outdir=' .. directory,
            '-aux-directory=/home/lizzy/Documents/theory/essays/dissertation/temp',
            'main.tex',
            '-gg', -- force rewrite until I can debug it
            '-pvc', -- server mode
        }
    elseif first_line == "% xelatex" then
        return { 'latexmk', '-xelatex', '-pvc', '-outdir=' .. directory, file }
    else
        return { 'latexmk', '-pdf', '-pvc', '-shell-escape', '-outdir=' .. directory, file }
    end
end

vim.api.nvim_create_autocmd("Vimenter", {
    -- This autocommand will only trigger if the buffer name matches the following patterns
    pattern = { "*.tex" },
    callback = function ()
        local command_args = write()
        local command_name = table.remove(command_args, 1)
        -- vim.uv.kill(420)
        vim.uv.spawn(command_name, {
            args = command_args,
            verbatim = true,
            -- uid = 4,
        })
    end,
    -- The autocommand will trigger the following lua function
})


-- vim.keymap.set('n', '<Leader>o', function()
--     vim.cmd('!' .. table.concat(write(), ' '))
-- end)
--
-- vim.keymap.set('n', '<Leader>O', function()
--     local tab = write()
--     table.insert(tab, '-gg')
--     vim.cmd('!' .. table.concat(tab, ' '))
-- end)
