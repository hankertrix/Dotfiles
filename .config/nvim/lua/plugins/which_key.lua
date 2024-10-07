-- Configuration for which-key

-- Returns the which-key plugin for lazy.nvim
return {
    "folke/which-key.nvim",
    cmd = "WhichKey",
    event = "VeryLazy",
    opts = {
        plugins = {
            spelling = {
                enabled = true,
                suggestions = 20,
            },
        },
    },
}
