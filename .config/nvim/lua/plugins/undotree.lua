-- Undotree configuration

-- Gets the module with the utilities
local utils = require("utils")

-- Returns the undotree module for lazy.nvim
return {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    lazy = true,
    cond = utils.firenvim_not_active,
    keys = {

        -- Keybind to toggle the undotree window
        { "<Leader>u", vim.cmd.UndotreeToggle, mode = "n", desc = "Toggles the undo tree window" }
    }
}
