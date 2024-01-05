-- Configuration for firenvim

-- The settings for firenvim
local local_settings = {
    [".*"] = {
        cmdline = "neovim",

        -- Never automatically use firenvim
        takeover = "never"
    }
}

vim.g.firenvim_config = {
    localSettings = local_settings
}

-- Returns the firenvim plugin for lazy.nvim
return {
    "glacambre/firenvim",
    lazy = require("utils").firenvim_not_active(),
    module = false,
    build = function()
        vim.fn["firenvim#install"](0)
    end
}

