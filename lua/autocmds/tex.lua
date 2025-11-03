vim.api.nvim_create_autocmd("VimLeave", {
    -- This autocommand will only trigger if the buffer name matches the following patterns
    pattern = { "*.tex" },
    command = "!rm /home/lizzy/Documents/theory/essays/dissertation/temp/*",
    -- The autocommand will trigger the following lua function
})
