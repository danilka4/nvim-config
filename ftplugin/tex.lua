local vim = vim
-- Checkmarks
vim.keymap.set('n', '<CR>', function()
    if vim.fn.expand('<cWORD>') == "\\item" then
        vim.cmd("normal! ciW\\item[$\\checkmark$]")
        vim.cmd("normal! B")
    elseif vim.fn.expand('<cWORD>') == "\\item[$\\checkmark$]" then
        vim.cmd("normal! ciW\\item")
        vim.cmd("normal! B")
    end
end)

-- Image moving around
vim.keymap.set('n', '<Leader>ir', function()
    local image_path = "~/Documents/skool/thesis/presentations/images/"
    local file_of_interest = vim.api.nvim_exec('!find -L ' .. image_path .. ' -name "*_.png"', true)
    if string.len(file_of_interest) == 74 then
        error("No file found")
    else
        local name = vim.fn.input("Name of Image: ")
        local date, _ = file_of_interest:match("^.+/(.+)%.(.+)$")
        -- vim.print('~/Documents/skool/thesis/presentations/images/'..date..name..'.png')
        -- vim.print(date)
        vim.cmd('!mv ' .. image_path .. date .. '.png ' .. image_path .. date .. name .. '.png')
    end
end)

local function write()
    local first_line = vim.fn.getline(1)
    local directory = vim.fn.expand('%:p:h')
    local file = vim.fn.expand('%')
    if directory == "/home/lizzy/Documents/theory/essays/dissertation" then
        -- vim.print("Test")
        return { 'latexmk', '-xelatex',
            '-outdir=' .. directory,
            '-aux-directory=/home/lizzy/Documents/theory/essays/dissertation/temp',
            '-gg', -- force rewrite until I can debug it
            'main.tex' }
    elseif first_line == "% xelatex" then
        return { 'latexmk', '-xelatex', '-outdir=' .. directory, file }
    else
        return { 'latexmk', '-pdf', '-shell-escape', '-outdir=' .. directory, file }
    end
end

vim.keymap.set('n', '<Leader>o', function()
    vim.cmd('!' .. table.concat(write(), ' '))
end)

vim.keymap.set('n', '<Leader>O', function()
    local tab = write()
    table.insert(tab, '-gg')
    vim.cmd('!' .. table.concat(tab, ' '))
end)

vim.api.nvim_create_autocmd("BufWritePost", {
    callback = function()
        local command_args = write()
        local command_name = table.remove(command_args, 1)
        -- vim.uv.kill(420)
        vim.uv.spawn(command_name, {
            args = command_args,
            verbatim = true,
            -- uid = 4,
        })
    end
})
vim.g.tex_flavor = "latex"
