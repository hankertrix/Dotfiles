-- Aerial configuration
-- Currently the plugin is only used for the lualine winbar

-- Gets the module with the utilities
local utils = require("utils")

-- Returns the aerial plugin for lazy.nvim
return {
    "stevearc/aerial.nvim",
    cond = utils.firenvim_not_active,
    cmd = "AerialToggle",
    opts = {
        attach_mode = "global",
        icons = require("shared_configs").icons.lsp_kind,
    },
    keys = {

        -- The keybind to toggle the Aerial menu
        {
            "<Leader>at",
            vim.cmd.AerialToggle,
            mode = "n",
            desc = "Open the Aerial menu",
        },
    },
}
