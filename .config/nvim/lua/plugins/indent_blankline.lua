-- Indent blankline configuration

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up indent_blankline
local function indent_blankline_setup()

    -- Stops executing if the package isn't installed
    if not utils.status_ok("ibl") then return end

    -- Indent blankline setup
    require("ibl").setup {
        scope = {
            show_start = false,
            show_end = false,
            highlight = "Label"
        }
    }

end


-- Returns the indent blankline module for lazy.nvim
return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    cond = utils.firenvim_not_active,
    event = "VeryLazy",
    config = indent_blankline_setup
}
