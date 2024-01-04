-- Gitsigns configuration

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up gitsigns
local function setup()

    -- Stops executing if the packages aren't installed
    if not utils.status_ok("gitsigns") then return end

    -- Set up gitsigns
    require("gitsigns").setup()

end

-- Returns the gitsigns module for lazy.nvim
return {
    "lewis6991/gitsigns.nvim",
    config = setup,
    cond = utils.firenvim_not_active,
    cmd = "Gitsigns",
    event = "BufReadPre"
}
