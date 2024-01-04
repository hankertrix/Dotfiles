-- Configuration to set the colour scheme

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up the themes
local function setup()

    -- The theme that I want to use
    local theme = "bluloco"

    -- Stops executing if the theme isn't installed
    if not utils.status_ok(theme) then return end

    -- If firenvim isn't active, sets the colour scheme to bluloco dark
    if utils.firenvim_not_active() then vim.cmd("colorscheme bluloco-dark")

        -- Otherwise, sets the colour scheme to bluloco light
    else vim.cmd("colorscheme bluloco-light") end

end

-- Returns the theme module for lazy.nvim
return {

    -- Bluloco theme
    "uloco/bluloco.nvim",
    config = setup,
    lazy = false,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" }
}

