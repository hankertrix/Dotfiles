-- The configuration for the smart column plugin
-- Currently it's smartcolumn.nvim

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up the smart column plugin
local function setup()

    -- Stops executing if the package isn't installed
    if not utils.status_ok("smartcolumn") then return end

    -- Set up the smart column plugin
    require("smartcolumn").setup {

        -- Show a line on the right that represents the maximum column width
        -- This makes it easier to keep to a character limit, usually 80
        colorcolumn = "80",

        -- Disable the plugins for the filetypes below
        disabled_filetypes = {
            "help",
            "text",
            "markdown",
            "checkhealth",

            -- Plugin specific filetypes
            "lazy",
            "mason",
            "lspinfo",
            "null-ls-info",
            "fugitive",
            "gitcommit",
            "undotree",
            "aerial",
            "harpoon",
            "minifiles",
            "Trouble",
            "TelescopePrompt",
            "WhichKey"
        }
    }

end

-- Returns the smart column plugin for lazy.nvim
return {
    "m4xshen/smartcolumn.nvim",
    config = setup,
    event = { "BufReadPost", "BufNewFile", "BufWritePre" }
}
