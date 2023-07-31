-- Configuration for Vim Illuminate

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up vim-iluuminate
local function vim_illuminate_setup()

    -- Stops executing if the package isn't installed
    if not utils.status_ok("illuminate") then return end

    -- Set up Vim Illuminate
    require("illuminate").configure({

        -- Don't illuminate text on these file types
        filetypes_denylist = utils.plugin_file_types,

        -- Only highlight when there are 2 or more words
        min_count_to_highlight = 2,
    })

end

-- Returns the vim-illuminate module for lazy.nvim
return {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    cond = utils.firenvim_not_active,
    config = vim_illuminate_setup
}
