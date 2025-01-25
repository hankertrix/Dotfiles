-- Auto pair configuration
-- Currently, it's nvim-autopairs

-- Returns the auto pairs plugin for lazy.nvim
return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    cond = function() return not vim.list_contains({ "typr" }, vim.bo.filetype) end,
    opts = {},
}
