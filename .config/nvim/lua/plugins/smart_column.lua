-- The configuration for the smart column plugin
-- Currently it's smartcolumn.nvim

-- Gets the module with the utilities
local utils = require("utils")

-- Returns the smart column plugin for lazy.nvim
return {
    "m4xshen/smartcolumn.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = {

        -- Show a line on the right that represents the maximum column width
        -- This makes it easier to keep to a character limit, usually 80
        colorcolumn = tostring(require("shared_configs").max_line_length),

        -- Disable the plugins for the filetypes below
        disabled_filetypes = vim.list_extend(
            { "text", "markdown" },
            utils.plugin_file_types
        ),
    },
}
