require("nvim-autopairs").setup({
    ignored_next_char = "[%w%.]" -- alphanumeric ignored
})
local cmp = require'cmp'
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local handlers = require('nvim-autopairs.completion.handlers')
--cmp.event:on(
--    'confirm_done',
--    cmp_autopairs.on_confirm_done()
--)


    local handlers = require('nvim-autopairs.completion.handlers')
    
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done({
        filetypes = {
            -- "*" is a alias to all filetypes
            ["*"] = {
                ["("] = {
                    kind = {
                        cmp.lsp.CompletionItemKind.Function,
                        cmp.lsp.CompletionItemKind.Method,
                    },
                    handler = handlers["*"]
                }
            },
            lua = {
                ["("] = {
                    kind = {
                        cmp.lsp.CompletionItemKind.Function,
                        cmp.lsp.CompletionItemKind.Method
                    },
                    ---@param char string
                    ---@param item item completion
                    ---@param bufnr buffer number
                    handler = function(char, item, bufnr)
                        -- Your handler function. Inpect with print(vim.inspect{char, item, bufnr})
                    end
                }
            },
            -- Disable for tex
            --tex = false
        }
    })
)

local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')
npairs.add_rule(Rule(" '", "'"))
--npairs.add_rule(Rule("$", "$", "tex"))
npairs.add_rule(Rule("$ ", " $", "tex"))
npairs.add_rules{
    Rule(' ', ' ')
    :with_pair(function (opts)
        local pair = opts.line:sub(opts.col - 1, opts.col)
        return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),
    Rule('( ', ' )')
    :with_pair(function() return false end)
    :with_move(function (opts)
        return opts.prev_char:match('.%)') ~= nil
    end),
    Rule('[ ', ' ]')
    :with_pair(function() return false end)
    :with_move(function (opts)
        return opts.prev_char:match('.%]') ~= nil
    end),
    Rule('{ ', ' }')
    :with_pair(function() return false end)
    :with_move(function (opts)
        return opts.prev_char:match('.%}') ~= nil
    end),
    Rule('$ ', ' $')
    :with_pair(function() return false end)
    :with_move(function (opts)
        return opts.prev_char:match('.%$') ~= nil
    end)

}
