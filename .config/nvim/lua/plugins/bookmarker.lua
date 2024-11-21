-- The configuration for the bookmarking plugin
-- Currently, the plugin is arrow.nvim

-- Gets the module with the utilities
local utils = require("utils")

-- The table of key binds
local keybinds = {
    view_bookmarked_files = "<C-e>",
    view_buffer_bookmarks = "<Leader>m",
}

-- Returns the bookmarking plugin for lazy.nvim
return {
    "otavioschwanck/arrow.nvim",
    cond = utils.firenvim_not_active,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        show_icons = true,
        leader_key = keybinds.view_bookmarked_files,
        buffer_leader_key = keybinds.view_buffer_bookmarks,
    },
    keys = {
        {keybinds.view_bookmarked_files, mode = "n", desc = "View bookmarked files"},
        {keybinds.view_buffer_bookmarks, mode = "n", desc = "View buffer-local bookmarks"},
    },
}
