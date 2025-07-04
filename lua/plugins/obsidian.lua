return {
        "obsidian-nvim/obsidian.nvim",
        -- commit = "3703ea61c9838d090dff4b43c4d80df97c01c3b9",
        -- version = "*",
        lazy = true,
        ft = "markdown",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },

        opts = {
            workspaces = {
                {
                    name = "personal",
                    path = "~/Documents/theory/",
                    -- Optional, override certain settings.
                    overrides = {
                        notes_subdir = "web",
                    },
                },
            },
            new_notes_location = "notes_subdir",

            wiki_link_func = "prepend_note_path",
            -- function(opts)
            --     return require("obsidian.util").wiki_link_path_prefix(opts)
            -- end,
            -- completion = {
            --     prepend_note_path = true,
            --     use_path_only = true
            -- },
            note_id_func = function(title)
                return title:lower()
                --:gsub(" ", "_")
            end,
            -- note_path_func = function(spec)
            --     -- This is equivalent to the default behavior.
            --     local title = tostring(spec.id)
            --     title = title:gsub(" ", "_")
            --     title = title:gsub("'", "")
            --     title = title:lower()
            --     local path = spec.dir / title
            --     return path:with_suffix(".md")
            -- end,
            note_frontmatter_func = function(note)
                -- Add the title of the note as an alias.
                -- if note.title then
                --     note:add_alias(note.title)
                -- end

                -- date_created chooses today if non-existent
                local out = { id = note.id, aliases = note.aliases, tags = note.tags, date_created = note.date_created or os.date("%Y-%m-%d") }

                -- Adds a wip tag if doesn't exist
                if #note.tags == 0 then
                    table.insert(out.tags, "wip")
                end

                -- `note.metadata` contains any manually added fields in the frontmatter.
                -- So here we just make sure those fields are kept in the frontmatter.
                if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                    for k, v in pairs(note.metadata) do
                        out[k] = v
                    end
                end

                return out
            end,
            follow_url_func = function(url)
                if url:sub(1, 8) == "file:///" then
                    local formatted = url:sub(9, -1)
                    print(formatted)
                    vim.cmd("edit " .. formatted)
                else
                    print(url)
                    vim.fn.jobstart({ "xdg-open", url }) -- linux
                end
            end,
            completion = {
                -- Set to false to disable completion.
                blink = true,
                -- Trigger completion at 2 chars.
                min_chars = 2,
            },


            templates = {
                subdir = "templates",
                date_format = "%Y-%m-%d-%a",
                time_format = "%H:%M",
            },
            mappings = {
                ["<CR>"] = {
                    action = function()
                        return require("obsidian").util.gf_passthrough()
                    end,
                    opts = { noremap = false, expr = true, buffer = true },
                },
            },
        },
    }
