-- vim.g.feed_debug = true
return {
    "neo451/feed.nvim",
    -- dir = '~/Documents/nvim/feed.nvim/',
    -- dir = "~/Documents/nvim/feed.nvim",
    cmd = "Feed",
    ---@module 'feed'
    ---@type feed.config
    opts = {
            -- keys = {
            --     index = {
            --         { "q",      "<cmd>Feed quit<cr>" },
            --         { "?",      "<cmd>Feed hints<cr>" },
            --         { ".",      "<cmd>Feed dot<cr>" },
            --         { "u",      "<cmd>Feed undo<cr>" },
            --         { "<C-r>",  "<cmd>Feed redo<cr>" },
            --         { "<M-CR>", "<cmd>Feed split<cr>" },
            --         { "b",      "<cmd>Feed browser<cr>" },
            --         { "r",      "<cmd>Feed refresh<cr>" },
            --         { "R",      "<cmd>Feed update<cr>" },
            --         { "/",      "<cmd>Feed search<cr>" },
            --         { "Y",      "<cmd>Feed yank_url<cr>" },
            --         { "-",      "<cmd>Feed untag<cr>" },
            --         { "+",      "<cmd>Feed tag<cr>" },
            --         { "<cr>",   "<cmd>Feed entry<cr>" },
            --     },
            --     entry = {
            --         { "q", "<cmd>Feed quit<cr>" },
            --         { "?", "<cmd>Feed hints<cr>" },
            --         { "Y", "<cmd>Feed yank_url<cr>" },
            --         { "b", "<cmd>Feed browser<cr>" },
            --         { "}", "<cmd>Feed next<cr>" },
            --         { "{", "<cmd>Feed prev<cr>" },
            --         { "/", "<cmd>Feed search<cr>" },
            --         { "-", "<cmd>Feed untag<cr>" },
            --         { "+", "<cmd>Feed tag<cr>" },
            --         { "f", "<cmd>Feed full<cr>" },
            --         { "r", "<cmd>Feed urlview<cr>" },
            --     },
            -- },
    },
    config = function()
        require("feed").setup({
            feeds = {
                politics = {
                    "https://crimethinc.com/feed",
                    "https://ashevilleblade.com/?feed=rss2",
                    "https://thefreeradical.org/rss/",
                    -- "https://www.madycast.com/feed", -- This turned into Trans news network below \/
                    "https://rss.beehiiv.com/feeds/ZwjrCnHCyS.xml", -- Trans news network
                    "https://unicornriot.ninja/feed/",
                    "https://chuangcn.org/feed/",
                    "https://therealnews.com/author/mel-buer/feed",
                },
                tea = {
                    "https://seventeahouse.com/feed/",
                }
            },
            search = {
                default_query = "@6-months-ago +unread ",
                sort_order = "ascending",
                -- default_query = "@6-months-ago",
            },
            zen = {
                enabled = false,
            },

        })
    end,
}

-- TODO: Make sure the win_opts excludes relative
