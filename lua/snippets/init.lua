local function load_snippets()
    local snippet_files = {
        -- "all",
        -- "lua",
        -- "tex",
        -- "r",
        -- "rmd",
        -- "go",
        -- "c",
        -- "cuda",
        "markdown",
        -- "rust",
    }

    for _, file in ipairs(snippet_files) do
        require("snippets." .. file)
    end
end

load_snippets()
