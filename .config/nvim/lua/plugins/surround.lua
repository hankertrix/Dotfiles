-- The configuration for the surround plugin
-- Currently it is nvim-surround

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up the surround plugin
local function setup()

    -- Stops executing if the package isn't installed
    if not utils.status_ok("nvim-surround") then return end

    -- Surround plugin setup
    require("nvim-surround").setup()

end


-- Returns the plugin module for lazy.nvim
return {
    "kylechui/nvim-surround",
    config = setup,
    version = "*",
    event = "VeryLazy"
}
