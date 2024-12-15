-- Configuration for quality of life related plugins
--
-- Currently the plugins used are:
--   - vim-sleuth for automatically detecting the indentation type
--   - mini.trailspace to trim trailing whitespaces and blank lines
--   - snacks.nvim for general quality of life improvements

-- Return the quality of life related plugins for lazy.nvim
return {

    -- Automatically detect the indentation type
    -- such as indentation using tabs vs spaces
    { "tpope/vim-sleuth" },

    -- Trim trailing whitespace and blank lines
    {
        "echasnovski/mini.trailspace",
        version = false,
        lazy = true,
        event = { "BufReadPost", "BufNewFile", "BufWritePre" },

        -- Create an autocommand to trim whitespace and blank lines on save
        config = function()
            require("mini.trailspace").setup()
            vim.api.nvim_create_autocmd("BufWritePre", {
                callback = function()
                    local mini_trailspace = require("mini.trailspace")
                    mini_trailspace.trim()
                    mini_trailspace.trim_last_lines()
                end,
            })
        end,
    },

    -- Snacks.nvim quality of life plugin
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            bigfile = { enabled = true },
            quickfile = { enabled = true },
            statuscolumn = { enabled = true },
            indent = {
                enabled = true,
                scope = {
                    hl = "Label",
                },
            },
        },

        -- Key binds
        keys = {
            {
                "<Leader>x",
                function() Snacks.bufdelete() end,
                mode = "n",
                desc = "Close the current buffer",
            },
        },
    },
}
