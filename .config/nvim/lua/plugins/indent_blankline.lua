-- Indent blankline configuration

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up indent_blankline
local function indent_blankline_setup()

    -- Stops executing if the package isn't installed
    if not utils.status_ok("indent_blankline") then return end

    -- Indent blankline setup
    require("indent_blankline").setup {
        show_current_context = true,
        show_end_of_line = true,
        space_char_blankline = " "
    }

end


-- Returns the indent blankline module for lazy.nvim
return {
    "lukas-reineke/indent-blankline.nvim",
    cond = utils.firenvim_not_active,
    event = "VeryLazy",
    config = indent_blankline_setup
}
