-- Git plugin configuration
-- Currently it's Neogit

-- Gets the module with the utilities
local utils = require("utils")

-- The configuration for the git plugin
local function config()
    --

    -- If the git plugin is not installed, then don't do anything
    if not utils.status_ok("neogit") then return end

    -- Setup the key binds to be the same as Magit
    require("neogit").setup({
        mappings = {
            popup = {
                ["F"] = "PullPopup",
                ["p"] = "PushPopup",
                ["P"] = "PushPopup",
                ["_"] = "RevertPopup",
                ["v"] = false,
                ["O"] = "ResetPopup",
                ["X"] = false,
                ["z"] = "StashPopup",
                ["Z"] = "WorktreePopup",
                ["w"] = false,
            },
            status = {
                ["X"] = "Untrack",
                ["K"] = false,
                ["<C-g>"] = "Close",
            },
        },
    })
end

-- Returns the git plugin for lazy.nvim
return {
    "NeogitOrg/neogit",
    dependencies = "nvim-lua/plenary.nvim",
    lazy = true,
    cond = utils.firenvim_not_active,
    config = config,
    cmd = "Neogit",
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
