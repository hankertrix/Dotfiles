-- Configuration for the plugin to display indentation
-- Currently, it is indent-blankline

-- Returns the indentation display plugin for lazy.nvim
return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = {
        scope = {
            show_start = false,
            show_end = false,
            highlight = "Label",
        },
    },
}
