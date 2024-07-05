local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        --null_ls.builtins.formatting.stylua,
        --null_ls.builtins.diagnostics.eslint,
        --null_ls.builtins.completion.spell,
        require('none-ls.formatting.autopep8'),
        require('none-ls.formatting.latexindent'),
    },
})
