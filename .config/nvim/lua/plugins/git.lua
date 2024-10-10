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
    cmd = "Neogit",
    opts = {
        sections = {
            untracked = {
                folded = true,
            },
        },
        mappings = {
            popup = {
                ["F"] = "PullPopup",
                ["p"] = "PushPopup",
                ["P"] = "PushPopup",
                ["_"] = "RevertPopup",
                ["v"] = false,
                ["O"] = "ResetPopup",
                ["X"] = false,
                ["%"] = "WorktreePopup",
                ["w"] = false,
            },
            status = {
                ["X"] = "Untrack",
                ["K"] = false,
            },
        },
    },
    keys = {

        -- The key bind to open Neogit
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
