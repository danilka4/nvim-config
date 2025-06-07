vim.opt.spell = true
vim.opt.spelllang = 'en_us'
vim.cmd("set spellsuggest+=20")
-- vim.cmd("UltiSnipsAddFiletypes markdown")

local function colon()
    vim.cmd("normal! $")
    local ending = vim.fn.expand('<cword>')
    return string.find(ending, ':') ~= nil
end
vim.keymap.set("i", "<CR>", function()
    if vim.fn.col(".") ~= vim.fn.col("$") then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<c-j>", true, true, true))
        return
    end
    local has_colon = colon()
    vim.cmd("normal! ^")
    local cword = vim.fn.expand('<cWORD>')
    if cword == "*" or cword == "-" then
        vim.cmd("normal! o* ")
    else
        vim.cmd("normal! o")
    end
    if has_colon then
        vim.cmd("normal! >>")
    end
    vim.cmd('startinsert!')
end, { noremap = true })

vim.keymap.set("n", "o", function()
    local has_colon = colon()
    vim.cmd("normal! ^")
    local cword = vim.fn.expand('<cWORD>')
    if cword == "*" or cword == "-" then
        vim.cmd("normal! o* ")
    else
        vim.cmd("normal! o")
    end
    if has_colon then
        vim.cmd("normal! >>")
    end
    vim.cmd('startinsert!')
end)

vim.keymap.set("n", "O", function()
    vim.cmd("normal! ^")
    local cword = vim.fn.expand('<cWORD>')
    if cword == "*" or cword == "-" then
        vim.cmd("normal! O* ")
    else
        vim.cmd("normal! O")
    end
    vim.cmd('startinsert!')
end)

vim.keymap.set("n", "<leader>od", ":ObsidianTemplate default.md<CR>")
vim.keymap.set("n", "<leader>ob", ":ObsidianBacklinks<CR>")
vim.keymap.set("n", "<leader>of", function()
    local value = vim.inspect(vim.opt.colorcolumn:get())
    if value == "{}" then
        vim.opt.colorcolumn = "100"
        vim.wo.wrap = false
    else
        vim.opt.colorcolumn = {}
        vim.wo.wrap = true
    end
end)
vim.keymap.set("n", "<leader>og", function()
    vim.fn.jobstart("obsidian")
end)
vim.keymap.set("n", "<leader>ot", ":split ~/Documents/theory/wiki/todo.md<CR>")
vim.keymap.set("n", "<leader>ow", "/#<CR>:nohlsearch<CR>jVGg<c-g>")
vim.keymap.set("n", "<leader>ff", ":ObsidianQuickSwitch<CR>")
local function initial_cat(name)
    return "!cat " ..
        name ..
        " | sed 's/\\\\\\(.\\){\\(.\\)}/\\2/g' | sed 's/\\[\\[\\([a-zA-Z0-9_\\. \\/]*\\)|t,\\([a-zA-Z0-9_ -,-]*\\),\\([a-zA-Z0-9_ ]*\\)\\]\\]/@\\3[\\2]/g' | sed 's/\\[\\[\\([a-zA-Z0-9_ \\/\\.]*\\)|p,,\\([a-zA-Z0-9_ ]*\\)\\]\\]/\\[@\\2\\]/g' | sed 's/\\[\\[\\([a-zA-Z0-9_ \\/\\.]*\\)|\\([a-zA-Z0-9_ ]*\\),\\([a-zA-Z0-9_ -,-]*\\),\\([a-zA-Z0-9_ ]*\\)\\]\\]/\\[@\\4, \\3 \\]/g' | sed 's/\\[\\[\\([^|]*\\)|\\([^|]*\\)\\]\\]/\\2/g'"
end

vim.keymap.set("n", "<c-s>", '<c-w>s<c-w>k:ObsidianFollowLink<CR>'
)


vim.keymap.set("n", "<leader>oc",
    function()
        local lc = vim.api.nvim_buf_line_count(0)
        if lc > 20 then
            vim.print("Buffer too big")
            return
        end
        local name = vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
        -- Adds to clipboard
        vim.cmd(initial_cat(name) ..
            "| pandoc -t markdown_strict --bibliography ~/Documents/theory/sources.bib --citeproc --columns 9999 2>/dev/null | sed -e 's/\\\\//g' | sed -e 's/\\*//g' | xclip -selection clipboard")
        -- Adds to anki csv
        local note_info = require("obsidian.note").from_buffer(0)
        for _, v in pairs(note_info) do
            if v ~= "w" then
                vim.print("Compiled but didn't add to anki due to no 'w' tag written")
                return
            end
        end
        vim.print("Compiled and adding to anki")
        vim.cmd(initial_cat(name) ..
            "| pandoc -t markdown_strict --bibliography ~/Documents/theory/sources.bib --citeproc --columns 9999 2>/dev/null | sed -e 's/\\\\//g' | sed -e 's/\\*//g' | anki_add.py")
    end,
    { silent = true })
vim.keymap.set("n", "<leader>ot", function()
        local name = vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
        vim.cmd("!cat " ..
            name ..
            " | sed -e '/---/,/---/d' | sed -e 's/^\\#.*$//' | sed -e 's/^$//' | sed 's/\\[\\[\\([a-zA-Z0-9_\\. \\/]*\\)|\\([pt]\\),\\([a-zA-Z0-9 -,-]*\\),\\([a-zA-Z0-9_ ]*\\)\\]\\]/\\\\cite\\2[\\3]{\\4}/g' | sed 's/\\[\\[\\([^|]*\\)|\\([^|]*\\)\\]\\]/\\2/g' | grep -v '^$' | xclip -selection clipboard")
    end,
    { silent = true })

-- buffer_to_string() .. "\" | sed -e '/---/,/---/d' | sed -e 's/^\\#.*$//' | sed -e 's/\\[\\[[a-zA-Z0-9_\\. \\/]*|//g' | wc -w")

vim.keymap.set("v", "<leader>ol", ":ObsidianLinkNew<CR>")

local buffer_to_string = function()
    local content = vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false)
    return string.gsub(string.gsub(string.gsub(string.gsub(table.concat(content, "\n"), '"', ''), '$', ''), '\\', ''),
        '^', '')
end

local function getWords()
    -- Prevents lag for massive files
    if vim.fn.line('$') > 30 then
        return "reading notes"
    end

    -- local _, amount_spaces = string.gsub(filename, " ", " ")
    -- local subtract = 3 * (amount_spaces + 1) + 9

    local words = vim.fn.system(
        "echo \"" ..
        buffer_to_string() ..
        "\" | sed -e '/---/,/---/d' | sed -e 's/^\\#.*$//' | sed -e 's/\\[\\[[^|]*|//g' | wc -w")
    return tonumber(words)
    -- return tostring(vim.fn.wordcount().words - subtract)--..','.. tostring(subtract)
    -- return words
end

vim.keymap.set("n", "<leader>ow", function()
    vim.print(getWords())
end)

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'everforest',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding',
            getWords,
            'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
}

-- Opens notes associated with RSS feed and potentially add to bib if doesn't exist

local bib_format = [[@online{heheheha,
    title = {%s},
    author = {%s},
    publisher = {%s},
    url = {%s},
    month = {%d},
    year = {%d},
}]]

vim.keymap.set("n", "<Leader>on", function()
    local feed_desc = require("feed").get_entry()

    local title = feed_desc["title"]

    -- Checks for existence
    local handle = io.popen('grep -c "{' .. title .. '}" ~/Documents/theory/sources.bib')
    if handle == nil then
        vim.print("Can't grep for some reason")
        return 1
    end
    local count_instances = handle:read("*a")
    -- vim.print("'" .. count_instances .. "'")

    -- If title doesn't exist in bibliography
    if count_instances == "0\n" then
        -- Sets up citation
        local url = feed_desc["link"]
        -- Gets publisher from url hopefully
        local feed_url = feed_desc["feed"]
        local _, start = string.find(feed_url, "://")
        local finish, _ = string.find(feed_url, "%.")
        start = start + 1
        finish = finish - 1
        local publisher = string.sub(feed_url, start, finish)

        -- Gets author if exists
        local author = ""
        if feed_desc["author"] ~= nil then
            author = feed_desc["author"]
        else
            -- Do weird stuff with the url as author if placeholder
            author = publisher
        end
        local time = feed_desc["time"]    -- Unix based time
        local month = os.date("%m", time) -- Extracts year from unix
        local year = os.date("%Y", time)  -- Extracts year from unix
        if author == "crimethinc" then
            author = "{CrimethInc. Ex-Workers Collective}"
            publisher = "CrimethInc."
        end
        if publisher == "ashevilleblade" then
            publisher = "The Asheville Blade"
        end
        local entry = string.format(bib_format,
            title, author, publisher, url, month, year)
        -- Adds new
        vim.cmd("tabnew")
        vim.cmd("term")
        vim.api.nvim_feedkeys('iecho "' .. entry .. '" | tha stdin ', "n", false)
    else
        -- Must find associated key to file
        local handle_find_key = io.popen('sh title_bibkey.sh "' .. title .. '"')
        if handle_find_key == nil then
            vim.print("Can't find key")
            return 1
        end
        local bib_path = handle_find_key:read("*a")
        vim.cmd("tabnew " .. bib_path)
    end
end)
