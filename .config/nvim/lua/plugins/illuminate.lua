-- Configuration for the plugin to highlight the same word
-- Currently, the plugin is vim-illuminate

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up the highlighting plugin
local function setup()

    -- Stops executing if the package isn't installed
    if not utils.status_ok("illuminate") then return end

    -- Set up the plugin
    require("illuminate").configure({

        -- Don't illuminate text on these file types
        filetypes_denylist = utils.plugin_file_types,

        -- Only highlight when there are 2 or more words
        min_count_to_highlight = 2,

        -- Have a small delay before highlighting
        delay = 200,

        -- Set the cutoff for a large file
        large_file_cutoff = 2000,

        -- Use the LSP to provide the highlighting for large files
        large_file_overrides = {
            providers = { "lsp" },
        },
    })

end

-- Returns the plugin module for lazy.nvim
return {
    "RRethy/vim-illuminate",
    config = setup,
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    cond = utils.firenvim_not_active
}
