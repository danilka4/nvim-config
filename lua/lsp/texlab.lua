return {
    cmd = { 'texlab', '-vvvv' },
    settings = {
        texlab = {
            formatterLineLength = -1,
            diagnostics = {
                ignoredPatterns = { 'Unused label' }
            }
        }
    },
    filetypes = { 'tex' }
}

