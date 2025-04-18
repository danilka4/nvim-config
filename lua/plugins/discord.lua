return {
        'andweeb/presence.nvim',
        config = function()
            require("presence").setup({
                auto_update         = true,
                neovim_image_text   = "I'm not stuck in vim. Vim is stuck around me",
                -- log_level           = "debug",
                debounce_timeout    = 10,
                enable_line_number  = false,
                buttons             = false,
                show_time           = true,
                -- Rich Presence text options
                editing_text        = "Editing %s",
                file_explorer_text  = "Browsing %s",
                git_commit_text     = "Committing changes",
                plugin_manager_text = "Managing plugins",
                reading_text        = "Reading %s",
                workspace_text      = "Working on %s",
                line_number_text    = "Line %s out of %s"
            })
        end
}
