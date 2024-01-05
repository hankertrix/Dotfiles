-- Auto pair configuration
-- Currently, it's nvim-autopairs

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up the auto pair plugin
local function setup()

    -- Stops executing if the package isn't installed
    if not utils.status_ok("nvim-autopairs") then return end

    -- Set up auto pairs
    require("nvim-autopairs").setup()

end

-- Returns the auto pairs plugin for lazy.nvim
return {
    "windwp/nvim-autopairs",
    config = setup,
    event = "InsertEnter"
}
