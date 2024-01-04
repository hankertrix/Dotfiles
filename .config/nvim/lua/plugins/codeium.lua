-- Configuration for codeium, an AI code completion tool

-- Gets the module with the utilities
local utils = require("utils")

-- The table of descriptions
local descriptions = {
    ["accept"] = "Accepts the AI's autocompletion",
    ["reject"] = "Reject the AI's autocompletion",
    ["next"] = "Gets the next suggestion",
    ["previous"] = "Gets the previous suggestion",
}

-- Returns the codeium module for lazy.nvim
return {
    "Exafunction/codeium.vim",
    cond = utils.firenvim_not_active,
    event = "InsertEnter",
    lazy = true,
    enabled = false,
    keys = {
        { "<C-g>", function () return vim.fn["codeium#Accept"]() end, mode = "n", desc = descriptions["accept"] },
        { "<C-x>", function() return vim.fn["codeium#Clear"]() end, mode = "n", desc = descriptions["reject"] },
        { "<C-;>", function() return vim.fn["codeium#CycleCompletions"](1) end, mode = "n", desc = descriptions["next"] },
        { "<C-,>", function() return vim.fn["codeium#CycleCompletions"](-1) end, mode = "n", desc = descriptions["previous"] }
    }
}

