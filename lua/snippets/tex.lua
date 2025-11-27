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
    s("list", fmt("\\begin{{itemize}}\n\t\\item {}\n\\end{{itemize}}", { i(0), })),
    s("frame", fmt("\\begin{{frame}}{{{}}}\n\t{}\n\\end{{frame}}", { i(1, "Frame Title"), i(0), })),
    s({trig="cp", snippetType="autosnippet" }, fmt("\\citep[{}]{{{}}} {}", { i(1), i(2), i(0), })),
    s({trig="ct", snippetType="autosnippet"}, fmt("\\citet[{}]{{{}}} {}", { i(1), i(2), i(0), })),
    s({trig="fig"}, fmt("\\begin{{figure}}\n\t\\centering\n\t{}\n\t\\caption{{{}}}\n\t\\label{{fig:{}}}\n\\end{{figure}}", { i(0), i(1), i(2), })),
})
