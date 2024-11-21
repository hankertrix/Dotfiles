-- Comment plugin configuration
-- Right now it's Comment.nvim

-- Gets the module with the utilities
local utils = require("utils")

-- The table of descriptions
local descriptions = {
    current_line = "Toggle commenting on current line",
    current_selection = "Toggle comments on current selection",
    blockwise = "Comment toggle blockwise",
    linewise = "Comment toggle linewise",
}

-- The escape key
local esc_key = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)

-- Returns the comment plugin for lazy.nvim
return {
    "numToStr/Comment.nvim",
    cond = utils.firenvim_not_active,
    opts = {},
    keys = {
        {
            "<C-/>",
            function()
                require("Comment.api").toggle.linewise.current()
            end,
            mode = "n",
            desc = descriptions.current_line,
        },
        {
            "<C-/>",
            function()
                vim.api.nvim_feedkeys(esc_key, "nx", false)
                require("Comment.api").toggle.linewise(vim.fn.visualmode())
            end,
            mode = "v",
            desc = descriptions.current_selection,
        },
        {
            "gb",
            mode = { "n", "v" },
            desc = descriptions.blockwise,
        },
        {
            "gc",
            mode = { "n", "v" },
            desc = descriptions.linewise,
        },
    },
}
