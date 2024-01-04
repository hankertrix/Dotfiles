-- Configuration for Mason

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up Mason
local function setup()

    -- Stops executing if the package isn't installed
    if not utils.status_ok("mason") then return end

    -- Set up Mason
    require("mason").setup()

end

-- Returns the Mason module for lazy.nvim
return {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = setup,
    lazy = true,
    cond = utils.firenvim_not_active,
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
}
