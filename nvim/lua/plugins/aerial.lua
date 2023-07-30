-- Aerial configuration

-- Gets the module with the utilities
local utils = require("utils")

-- Key mapping to open aerial
vim.keymap.set("n", "<Leader>at", vim.cmd.AerialToggle, { desc = "Opens the Aerial menu" })

-- Function to set up aerial
local function aerial_setup()

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
    cmd = "AerialToggle",
    cond = utils.firenvim_not_active,
    config = aerial_setup
}
