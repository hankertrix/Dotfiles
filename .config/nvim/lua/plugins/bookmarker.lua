-- The configuration for the bookmarking plugin
-- Currently, the plugin is arrow.nvim

-- Gets the module with the utilities
local utils = require("utils")

-- Returns the bookmarking plugin for lazy.nvim
return {
    "otavioschwanck/arrow.nvim",
    cond = utils.firenvim_not_active,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        show_icons = true,
        leader_key = "<C-e>",
        buffer_leader_key = "<Leader>m",
    },
}
