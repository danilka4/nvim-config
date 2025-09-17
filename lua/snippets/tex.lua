local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local extras = require("luasnip.extras")
local fmt = require("luasnip.extras.fmt").fmt
local rep = extras.rep

ls.add_snippets("tex", {
    -- s("link", fmt("[{}]({})", { rep(1), i(1) })),
    -- s("image", fmt("![]({})", { i(1) })),
    -- s("comment", fmt("<!-- {} -->{}", { i(1), i(0) })),
    -- s("<--", fmt("<!-- {} -->{}", { i(1), i(0) })),
    s("beg", fmt("\\begin{{{}}}\n\t{}\n\\end{{{}}}", { i(1), i(0), rep(1) })),
    s("frame", fmt("\\begin{{frame}}{{{}}}\n\t{}\n\\end{{frame}}", { i(1, "Frame Title"), i(0), })),
})
