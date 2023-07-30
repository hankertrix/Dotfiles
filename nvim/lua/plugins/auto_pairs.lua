-- Auto pair configuration

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up nvim-autopairs
local function auto_pairs_setup()

    -- Stops executing if the package isn't installed
    if not utils.status_ok("nvim-autopairs") then return end

    -- Set up auto pairs
    require("nvim-autopairs").setup()

end

-- Returns the autopairs module for lazy.nvim
return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = auto_pairs_setup
}
