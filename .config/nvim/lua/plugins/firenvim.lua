-- Configuration for firenvim

-- The settings for firenvim
local local_settings = {
    [".*"] = {

        -- Use Neovim's command line
        cmdline = "neovim",

        -- Never automatically use firenvim
        takeover = "never",
    },
}

-- Set up the firenvim configuration
vim.g.firenvim_config = {
    localSettings = local_settings,
}

-- Returns the firenvim plugin for lazy.nvim
return {
    "glacambre/firenvim",
    lazy = require("utils").firenvim_not_active(),
    module = false,
    build = ":call firenvim#install(0)",
}
