-- Configuration for quality of life related plugins
--
-- Currently the plugins used are:
--   - vim-sleuth for automatically detecting the indentation type
--   - mini.trailspace to trim trailing whitespaces and blank lines
--   - quicker.nvim for an improved and editable quick fix list
--   - aerial.nvim to view an outline of the code
--   - snacks.nvim for general quality of life improvements

-- Get the icons from the shared configurations
local icons = require("shared_configs").icons

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
                "TrimWhitespaceOnSave",
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

    -- Improved quick fix list for Neovim
    {
        "stevearc/quicker.nvim",
        ft = "qf",
        opts = {

            -- Key binds within the quick fix menu
            keys = {
                {
                    ">",
                    function()
                        require("quicker").expand({
                            before = 2,
                            after = 2,
                            add_to_existing = true,
                        })
                    end,
                    desc = "Expand quick fix context",
                },

                {
                    "<",
                    function() require("quicker").collapse() end,
                    desc = "Collapse quick fix context",
                },
            },
        },
    },

    -- Show an outline of the code in the current file
    {
        "stevearc/aerial.nvim",
        cmd = "AerialToggle",
        opts = {

            -- Display symbols for the current window
            attach_mode = "global",
            icons = icons.kind,
            layout = {
                min_width = 20,
            },
        },

        -- Toggle the Aerial menu
        keys = {
            {
                "<Leader>at",
                vim.cmd.AerialToggle,
                mode = "n",
                desc = "Open the Aerial menu",
            },
        },
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
            input = { enabled = true },
            picker = { enabled = true },
            indent = {
                enabled = true,
                scope = {
                    hl = "Label",
                },
            },
        },

        -- The configuration function
        config = function(_, opts)
            --

            -- The diagnostic icons
            local diagnostic_icons = {
                Error = icons.diagnostics.error,
                Warn = icons.diagnostics.warn,
                Hint = icons.diagnostics.hint,
                Info = icons.diagnostics.info,
            }

            -- Merge the given options with the picker configuration
            local options = vim.tbl_deep_extend("error", opts or {}, {
                picker = {
                    icons = {
                        diagnostics = diagnostic_icons,
                        kinds = icons.kind,
                    },
                },
            })

            -- Set up the snacks plugin with the options
            require("snacks").setup(options)
        end,

        -- Key binds
        keys = {
            {
                "<Leader>x",
                function() Snacks.bufdelete() end,
                mode = "n",
                desc = "Close the current buffer",
            },
            {
                "<F1>",
                function() Snacks.picker.help() end,
                mode = { "n", "x", "i" },
                desc = "Search through the help text using the fuzzy finder",
            },
            {
                "<Leader>pf",
                function() Snacks.picker.files() end,
                mode = "n",
                desc = "Find files using the fuzzy finder",
            },
            {
                "<Leader>ps",
                function() Snacks.picker.grep() end,
                mode = "n",
                desc = "Search within files for a string",
            },
            {
                "<Leader>pb",
                function() Snacks.picker.buffers() end,
                mode = "n",
                desc = "Search for open buffers using the fuzzy finder",
            },
            {
                "<Leader>pr",
                function() Snacks.picker.registers() end,
                mode = "n",
                desc = "Search through Vim registers",
            },
            {
                "<Leader>pk",
                function() Snacks.picker.pickers() end,
                mode = "n",
                desc = "Search through the list of pickers",
            },
        },
    },
}
