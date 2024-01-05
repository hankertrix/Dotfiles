-- Configuration for the plugin to highlight trailing spaces
-- Currently it's mini.trailspace

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up the trailspace plugin
local function setup()

    -- Stops executing if the package isn't installed
    if not utils.status_ok("mini.trailspace") then return end

    -- Set up the trailspace plugin
    require("mini.trailspace").setup()

end

-- Returns the trailspace plugin for lazy.nvim
return {
    "echasnovski/mini.trailspace",
    version = false,
    lazy = true,
    config = setup,
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    keys = {
        { "<Leader>rs", function() require("mini.trailspace").trim() end, mode = { "n", "x" }, desc = "Remove trailing whitespace" },
        { "<Leader>rl", function() require("mini.trailspace").trim_last_lines() end, mode = { "n", "x" }, desc = "Remove blank lines at the end of a file" }
    }
}
