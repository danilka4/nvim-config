return {
    cmd = { 'ltex-ls' },
    filetypes = { 'tex', 'latex', 'bib', 'bibtex', 'markdown', },
    settings = {
        ltex = {
            disabledRules = { ['en-US'] = { 'NUMBERS_IN_WORDS', 'MORFOLOGIK_RULE_EN_US', 'UPPERCASE_SENTENCE_START', 'EN_UNPAIRED_BRACKETS', 'UNLIKELY_OPENING_PUNCTUATION', 'COMMA_PARENTHESIS_WHITESPACE' } },
            enabled = { 'tex', 'latex', 'bib', 'plaintex', 'bibtex', 'markdown' },
        },
        -- dictionary = { ['en-US'] = obtainWords('/home/lizzy/.config/nvim/spell/en.utf-8.add') }
        -- enabled = {'latex'}
        -- enabled = { 'tex', 'latex' }
    },
}
