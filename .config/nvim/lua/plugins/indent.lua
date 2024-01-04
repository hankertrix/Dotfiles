-- Configuration for the plugin to display indentation
-- Currently, it is indent-blankline

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up the plugin to display indentation
local function setup()

    -- Stops executing if the package isn't installed
    if not utils.status_ok("ibl") then return end

    -- Setup for the plugin to display indentation
    require("ibl").setup {
        scope = {
            show_start = false,
            show_end = false,
            highlight = "Label"
        }
    }

end


-- Returns the plugin module for lazy.nvim
return {
    "lukas-reineke/indent-blankline.nvim",
    config = setup,
    main = "ibl",
    cond = utils.firenvim_not_active,
    event = { "BufReadPost", "BufNewFile", "BufWritePre" }
}
