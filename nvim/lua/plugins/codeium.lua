-- Configuration for codeium, an AI code completion tool

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up codeium
local function codeium_setup()

    -- Sets up the key maps to use with codeium
    vim.keymap.set("i", "<C-g>", function () return vim.fn["codeium#Accept"]() end, { expr = true, desc = "Accepts the AI's autocompletion" })
    vim.keymap.set("i", "<C-;>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true, desc = "Gets the next suggestion" })
    vim.keymap.set("i", "<C-,>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true, desc = "Gets the previous suggestion" })
    vim.keymap.set("i", "<C-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true, desc = "Reject the AI's autocompletion" })

end


-- Returns the codeium module for lazy.nvim
return {
    "Exafunction/codeium.vim",
    event = "InsertEnter",
    lazy = true,
    enabled = false,
    cond = utils.firenvim_not_active,
    config = codeium_setup
}

