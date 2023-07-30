-- Comment.nvim configuration

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up Comment.nvim
local function comment_setup()

    -- Stops executing if the package isn't installed
    if not utils.status_ok("Comment.api") then return end

    -- Gets the api from Comment.nvim
    local api = require("Comment.api")

    -- Toggle current line (linewise) using C-/ in normal mode
    vim.keymap.set("n", "<C-_>", api.toggle.linewise.current, { desc = "Toggle commenting on current line" })

    -- Gets the escape key
    local esc = vim.api.nvim_replace_termcodes(
        "<ESC>", true, false, true
    )

    -- Toggle selection (linewise) in visual mode
    vim.keymap.set("x", "<C-_>", function()
        vim.api.nvim_feedkeys(esc, "nx", false)
        api.toggle.linewise(vim.fn.visualmode())
    end, { desc = "Toggle commenting on current selection" })

    -- Initialise Comment.nvim
    require("Comment").setup()

end

-- Returns the comment.nvim module for lazy.nvim
return {
    "numToStr/Comment.nvim",
    cond = utils.firenvim_not_active,
    config = comment_setup,
    keys = {
        { "<C-_>", mode = "n" },
        { "<C-_>", mode = "v" },
        { "gb", mode = "n" },
        { "gb", mode = "v" },
        { "gc", mode = "n" },
        { "gc", mode = "v" },
    }
}

