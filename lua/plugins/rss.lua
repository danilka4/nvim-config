return {
    "neo451/feed.nvim",
    -- dir = "~/Documents/nvim/feed.nvim",
    cmd = "Feed",
    ---@module 'feed'
    ---@type feed.config
    opts = {},
    config = function()
        require("feed").setup({
            feeds = {
                politics = {
                    "https://crimethinc.com/feed",
                    "https://ashevilleblade.com/?feed=rss2",
                    "https://thefreeradical.org/rss/",
                    "https://www.madycast.com/feed",
                },
                tea = {
                    "https://seventeahouse.com/feed/",
                }
            },
            search = {
                -- default_query = "@6-months-ago +unread ",
                default_query = "@6-months-ago",
            },
            zen = {
                enabled = false,
            },
        })
    end,
}

-- TODO: Make sure the win_opts excludes relative
