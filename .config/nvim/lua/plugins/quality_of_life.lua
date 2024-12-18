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

        -- The function to configure the plugin
        config = function()
            --

            -- Get the plugin module
            local mini_trailspace = require("mini.trailspace")

            -- Set up the plugin
            mini_trailspace.setup()

            -- Create an auto command group to trim the whitespace on save
            local trim_whitespace_on_save_augroup = vim.api.nvim_create_augroup(
                "trim_whitespace_on_save",
                { clear = true }
            )

            -- Create the auto command to trim the whitespace on save
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = trim_whitespace_on_save_augroup,
                desc = "Trim whitespace on save",
                callback = function()
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
