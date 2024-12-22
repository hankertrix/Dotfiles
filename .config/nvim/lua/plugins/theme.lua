-- Configuration to set the colour scheme

-- Gets the module with the utilities
local utils = require("utils")

-- Returns the theme plugin for lazy.nvim
return {

    {
        -- Bluloco theme
        "uloco/bluloco.nvim",
        lazy = false,
        priority = 1000,
        dependencies = { "rktjmp/lush.nvim" },
        config = function()
            --

            -- Get the colour scheme I want to use
            local colour_scheme = "bluloco"

            -- Sets the theme
            vim.cmd("colorscheme " .. colour_scheme)
        end,
    },
}
