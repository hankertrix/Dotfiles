-- Configuration for indentation related plugins.
-- Currently, the plugins used are:
--   - indent-blankline.nvim for displaying indentation guides
--   - vim-sleuth for automatically detecting the indentation level

-- Returns the indentation related plugins to lazy.nvim
return {
    {
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
    },
    { "tpope/vim-sleuth" },
}
