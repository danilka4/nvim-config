return {
    cmd = { 'texlab' },
    settings = {
        texlab = {
            formatterLineLength = -1,
            diagnostics = {
                ignoredPatterns = { 'Unused label' }
            }
        }
    },
    filetypes = { 'tex', 'bib' }
}

