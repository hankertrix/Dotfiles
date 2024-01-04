-- Comment plugin configuration
-- Right now it's Comment.nvim

-- Gets the module with the utilities
local utils = require("utils")

-- The table of descriptions
local descriptions = {
    ["current_line"] = "Toggle commenting on current line",
    ["current_selection"] = "Toggle comments on current selection",
    ["blockwise"] = "Comment toggle blockwise",
    ["linewise"] = "Comment toggle linewise",
}

-- Function to set up the comment plugin
local function setup()

    -- Stops executing if the package isn't installed
    if not utils.status_ok("Comment.api") then return end

    -- Gets the api from Comment.nvim
    local api = require("Comment.api")

    -- Toggle current line (linewise) using C-/ in normal mode
    vim.keymap.set("n", "<C-/>", api.toggle.linewise.current, { desc = descriptions["current_line"] })

    -- Gets the escape key
    local esc = vim.api.nvim_replace_termcodes(
        "<ESC>", true, false, true
    )

    -- Toggle selection (linewise) in visual mode
    vim.keymap.set("x", "<C-/>", function()
        vim.api.nvim_feedkeys(esc, "nx", false)
        api.toggle.linewise(vim.fn.visualmode())
    end, { desc = descriptions["current_selection"] })

    -- Set up the commenting plugin
    require("Comment").setup()

end

-- Returns the plugin module for lazy.nvim
return {
    "numToStr/Comment.nvim",
    config = setup,
    cond = utils.firenvim_not_active,
    keys = {
        { "<C-/>", mode = "n", desc = descriptions["current_line"] },
        { "<C-/>", mode = "v", desc = descriptions["current_selection"] },
        { "gb", mode = { "n", "v" }, desc = descriptions["blockwise"] },
        { "gc", mode = { "n", "v" }, desc = descriptions["linewise"] },
    }
}

