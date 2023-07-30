-- Configuration for firenvim

local local_settings = {
    [".*"] = {
        cmdline = "neovim",

        -- Automatically use firenvim
        takeover = "always"
    }
}

vim.g.firenvim_config = {
    localSettings = local_settings
}

-- Returns the firenvim module for lazy.nvim
return {
    "glacambre/firenvim",
    cond = not require("utils").firenvim_not_active(),
    build = function()
        require("lazy").load({ plugins = "firenvim", wait = true })
        vim.fn["firenvim#install"](0)
    end
}

