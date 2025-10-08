local function file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end
local function yesterdate(current_date)
    local pattern = "(%d%d%d%d)-(%d%d)-(%d%d)"
    local year_str, month_str, day_str = string.match(current_date, pattern)
    local year = tonumber(year_str)
    local month = tonumber(month_str)
    local day = tonumber(day_str)
    local date_table = {
        year = year,
        month = month,
        day = day,
    }
    local time = os.time(date_table)
    time = time - 24 * 60 * 60
    local tries = 0
    local max_tries = 200
    while not file_exists("/home/lizzy/Documents/theory/daily/" .. os.date("%Y-%m-%d", time) .. ".md") and tries < max_tries do
        time = time - 24 * 60 * 60
        tries = tries + 1
    end
    if tries == max_tries then
        vim.print("Couldn't find previous date before this many days: " .. max_tries)
        return os.date("%Y-%m-%d", os.time() - 24 * 60 * 60 * 20)
    end
    return os.date("%Y-%m-%d", time)
end

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
        legacy_commands = false,
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
        daily_notes = {
            folder = "daily",
            template = "daily",
            default_tags = {},
            alias_format = "%Y-%m-%d",
        },

        checkbox = {
            enabled = true,
            create_new = true,
            order = { " ", "x" },
        },

        wiki_link_func = "prepend_note_path",
        -- function(opts)
        --     return require("obsidian.util").wiki_link_path_prefix(opts)
        -- end,
        -- completion = {
        --     prepend_note_path = true,
        --     use_path_only = true
        -- },
        note_id_func = function(title)
            return title:lower():gsub("'", ""):gsub("-", "")
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
            local out = {
                id = note.id,
                aliases = note.aliases,
                tags = note.tags,
                date_created = note.date_created or
                    os.date("%Y-%m-%d")
            }

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

        backlinks = {
            parse_headers = false,
            include_naked_urls = true,
            include_tags = true,
            include_file_urls = true,
            include_block_ids = true,
        },
        completion = {
            -- Set to false to disable completion.
            blink = true,
            -- Trigger completion at 2 chars.
            min_chars = 2,
        },

        attachments = {
            img_folder = "images"
        },

        templates = {
            subdir = "templates",
            date_format = "%Y-%m-%d-%a",
            time_format = "%H:%M",
            substitutions = {
                yesterday = function(ctx)
                    local filename = ctx.destination_path.filename
                    return yesterdate(filename)
                end,
                yesterday_text = function(ctx)
                    local filename = ctx.destination_path.filename
                    local yestername = yesterdate(filename)
                    local pattern = "\\[\\[.*\\]\\]" -- Replace with your actual regex pattern

                    local file = io.open("/home/lizzy/Documents/theory/daily/" .. yestername .. ".md", "r")

                    if not file then
                        print("Error: Could not open file " .. filename)
                        return
                    end
                    local content_table = {}
                    for line in file:lines() do
                        -- vim.print(line)
                        if line:find("%- %[ %]") then
                            table.insert(content_table, line)
                            -- vim.print("added")
                        end
                    end
                    file:close()
                    local content = table.concat(content_table, "\n")
                    return content
                end
            },
        },
        footer = {
            enabled = false,
        },
        statusline = {
            enabled = false, -- gets rid of warning about deprecation
        },

    },
}
