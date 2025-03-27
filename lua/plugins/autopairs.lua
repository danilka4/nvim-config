return {
    {
        'windwp/nvim-autopairs',
        config = function()
            require("nvim-autopairs").setup({
                ignored_next_char = "[%w%.]" -- alphanumeric ignored
            })

            local handlers = require('nvim-autopairs.completion.handlers')

            local Rule = require('nvim-autopairs.rule')
            local npairs = require('nvim-autopairs')
            npairs.remove_rule("'")
            -- npairs.add_rule(Rule(" '", "'"))
            --npairs.add_rule(Rule("$", "$", "tex"))
            npairs.add_rule(Rule("$ ", " $", "tex"))
            npairs.add_rules {
                Rule(' ', ' ')
                    :with_pair(function(opts)
                        local pair = opts.line:sub(opts.col - 1, opts.col)
                        return vim.tbl_contains({ '()', '[]', '{}' }, pair)
                    end),
                Rule('( ', ' )')
                    :with_pair(function() return false end)
                    :with_move(function(opts)
                        return opts.prev_char:match('.%)') ~= nil
                    end),
                Rule('[ ', ' ]')
                    :with_pair(function() return false end)
                    :with_move(function(opts)
                        return opts.prev_char:match('.%]') ~= nil
                    end),
                Rule('{ ', ' }')
                    :with_pair(function() return false end)
                    :with_move(function(opts)
                        return opts.prev_char:match('.%}') ~= nil
                    end),
                Rule('$ ', ' $')
                    :with_pair(function() return false end)
                    :with_move(function(opts)
                        return opts.prev_char:match('.%$') ~= nil
                    end)

            }
        end
    }
}
