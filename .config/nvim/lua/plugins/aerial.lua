-- Aerial configuration

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up aerial
local function setup()

    -- Stops executing if the package isn't installed
    if not utils.status_ok("aerial") then return end

    -- Sets up aerial
    require("aerial").setup({
        attach_mode = "global",
        icons = require("shared_configs").lsp_kind_icons
    })

end

-- Returns the aerial module for lazy.nvim
return {
    "stevearc/aerial.nvim",
    config = setup,
    cond = utils.firenvim_not_active,
    cmd = "AerialToggle",
    keys = {

        -- The keybind to toggle the Aerial menu
        { "<Leader>at", vim.cmd.AerialToggle, mode = "n", desc = "Opens the Aerial menu" }
    }
}
