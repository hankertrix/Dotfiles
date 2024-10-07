-- Configuration for the plugin to highlight trailing spaces
-- Currently it's mini.trailspace

-- Gets the module with the utilities
local utils = require("utils")

-- Returns the trailspace plugin for lazy.nvim
return {
    "echasnovski/mini.trailspace",
    version = false,
    lazy = true,
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = {},
    keys = {
        {
            "<Leader>rs",
            function()
                require("mini.trailspace").trim()
            end,
            mode = { "n", "x" },
            desc = "Remove trailing whitespace",
        },
        {
            "<Leader>rl",
            function()
                require("mini.trailspace").trim_last_lines()
            end,
            mode = { "n", "x" },
            desc = "Remove blank lines at the end of a file",
        },
    },
}
