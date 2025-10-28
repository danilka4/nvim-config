return {
    cmd = { 'pyright-langserver', '--stdio', },
    settings = {
        pyright = {
            disableOrganizeImports = true,
        },
    },
    filetypes = { 'py', 'python' },
}
