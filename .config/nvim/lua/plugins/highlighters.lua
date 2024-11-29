-- Configuration for highlight related plugins
-- Currently the plugins used are:
--   - hlargs to highlight arguments
--   - vim-illuminate to highlight the word under the cursor

-- Returns the highlight related plugins to lazy.nvim
return {
    {
        "m-demare/hlargs.nvim",
        event = { "BufReadPost", "BufNewFile", "BufWritePre" },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            excluded_filetypes = { "bigfile" },
        },
    },
    {
        "RRethy/vim-illuminate",
        event = { "BufReadPost", "BufNewFile", "BufWritePre" },
        config = function(_, opts)
            require("illuminate").configure(opts)
        end,
        opts = {

            -- Don't illuminate text on the disabled file types
            filetypes_denylist = vim.list_extend(
                { "bigfile" },
                require("shared_configs").disabled_file_types
            ),

            -- Only highlight when there are 2 or more words
            min_count_to_highlight = 2,

            -- Have a small delay before highlighting
            delay = 200,
        },
    },
}
