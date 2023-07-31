-- Undotree configuration

-- Gets the module with the utilities
local utils = require("utils")

vim.keymap.set("n", "<Leader>u", vim.cmd.UndotreeToggle, { desc = "Toggles the undo tree window" })

-- Returns the undotree module for lazy.nvim
return {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    lazy = true,
    cond = utils.firenvim_not_active,
}
