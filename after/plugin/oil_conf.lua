require("oil").setup({
    view_options = {
    is_always_hidden = function(name, bufnr)
        local ignore = {"fls", "xml", "fdb_latexmk", "bbl", "bcf", "blg", "nav", "out", "snm", "toc"}
        for _,v in pairs(ignore) do
            if vim.endswith(name, v) then
                return true
            end
        end
        return false
    end,
    },
})
