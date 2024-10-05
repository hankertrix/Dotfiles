-- Git plugin configuration
-- Currently it's Neogit

-- Gets the module with the utilities
local utils = require("utils")

-- Returns the git plugin for lazy.nvim
return {
    "NeogitOrg/neogit",
    dependencies = "nvim-lua/plenary.nvim",
    lazy = true,
    cond = utils.firenvim_not_active,
    config = true,
    cmd = "Neogit",
    keys = {

        -- The keybind to open Neogit
        {
            "<Leader>gs",
            function()
                require("neogit").open()
            end,
            mode = "n",
            desc = "Open Git",
        },
    },
}
