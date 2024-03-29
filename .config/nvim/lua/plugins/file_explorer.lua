-- The configuration for the file explorer
-- Current the plugin used is mini.files

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up the file explorer
local function setup()

    -- Stops executing if the packages aren't installed
    if not utils.status_ok("mini.files") then return end

    -- Set up mini files
    require("mini.files").setup {

        -- File explorer window options
        windows = {

            -- Turn on directory and file previewing
            preview = true,

            -- Set the width of the focused window
            width_focus = 30,

            -- Set the width of the non-focused window
            -- width_nofocus = 75,

            -- Set the width of the preview window
            width_preview = 30
        }
    }

end

-- Returns the file explorer plugin for lazy.nvim
return {
    "echasnovski/mini.files",
    version = false,
    config = setup,
    lazy = true,
    keys = {
        { "<Leader>pw", function() require("mini.files").open(vim.api.nvim_buf_get_name(0), true) end, mode = "n", desc = "Opens the directory of the current file" },
        { "<Leader>ec", function() require("mini.files").open("~/.config/nvim/lua/", true) end, mode = "n", desc = "Opens the Neovim config directory" }
    }
}
