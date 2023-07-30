-- Configuration for WhichKey

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up whick-key
local function which_key_setup()

    -- Stops executing if the package isn't installed
    if not utils.status_ok("which-key") then return end

    -- Sets up WhichKey
    require("which-key").setup({
        plugins = {
            spelling = {
                enabled = true,
                suggestions = 20
            }
        }
    })

end

-- Returns the which-key module for lazy.nvim
return {
    "folke/which-key.nvim",
    config = which_key_setup
}
