return {
    'saghen/blink.cmp',
    dependencies = {
        -- 'SirVer/ultisnips',
        'L3MON4D3/LuaSnip',
        'ribru17/blink-cmp-spell',
    },
    -- optional: provides snippets for the snippet source
    -- dependencies = { 'rafamadriz/friendly-snippets' },

    -- use a release tag to download pre-built binaries
    version = "1.*",

    opts = {
        keymap = { preset = 'super-tab' },

        appearance = {
            -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono'
        },

        -- (Default) Only show the documentation popup when manually triggered
        completion = { documentation = { auto_show = true } },
        signature = { enabled = true },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        snippets = { preset = 'luasnip' },
        sources = {
            default = {
                -- 'obsidian',
                -- 'obsidian_new',
                -- 'obsidian_tags',
                'snippets',
                'lsp',
                'path',
                'buffer',
                'spell',
            },
            providers = {
                -- ...
                lsp = {
                    min_keyword_length = 2, -- Number of characters to trigger provider
                    score_offset = 0,       -- Boost/penalize the score of the items
                },
                path = {
                    min_keyword_length = 0,
                },
                snippets = {
                    min_keyword_length = 1,
                    score_offset = 100,
                },
                buffer = {
                    min_keyword_length = 4,
                    max_items = 5,
                },
                spell = {
                    name = 'Spell',
                    score_offset = -1,
                    module = 'blink-cmp-spell',
                    opts = {
                        -- EXAMPLE: Only enable source in `@spell` captures, and disable it
                        -- in `@nospell` captures.
                        enable_in_context = function()
                            local curpos = vim.api.nvim_win_get_cursor(0)
                            local captures = vim.treesitter.get_captures_at_pos(
                                0,
                                curpos[1] - 1,
                                curpos[2] - 1
                            )
                            local in_spell_capture = false
                            for _, cap in ipairs(captures) do
                                if cap.capture == 'spell' then
                                    in_spell_capture = true
                                elseif cap.capture == 'nospell' then
                                    return false
                                end
                            end
                            return in_spell_capture
                        end,
                    },
                },
            },
        },



        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = {
            implementation = "prefer_rust_with_warning",
            prebuilt_binaries = {
                download = true,
                -- ignore_version_mismatch = true,
            },
            sorts = {
                function(a, b)
                    local sort = require('blink.cmp.fuzzy.sort')
                    if a.source_id == 'spell' and b.source_id == 'spell' then
                        return sort.label(a, b)
                    end
                end,
                -- This is the normal default order, which we fall back to
                'score',
                'kind',
                'label',
            },
        }
    },
    opts_extend = { "sources.default" }
}
