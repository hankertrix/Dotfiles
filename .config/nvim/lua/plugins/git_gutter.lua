-- Git gutter plugin configuration
-- Currently it's gitsigns

-- Gets the module with the utilities
local utils = require("utils")

-- Returns the git gutter plugin for lazy.nvim
return {
    "lewis6991/gitsigns.nvim",
    cond = utils.firenvim_not_active,
    event = "BufReadPre",
    opts = {},
}
