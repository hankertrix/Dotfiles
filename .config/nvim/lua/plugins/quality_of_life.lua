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
            picker = {
                enabled = true,

                -- Enable frecency
                matcher = {
                    frecency = true,
                },

                -- Key binds in the window
                win = {
                    input = {
                        keys = {
                            ["<C-j>"] = {
                                "preview_scroll_down",
                                mode = { "n", "i" },
                            },
                            ["<C-k>"] = {
                                "preview_scroll_up",
                                mode = { "n", "i" },
                            },
                        },
                    },
                },

                -- Icons
                icons = {
                    kinds = icons.kind,
                    diagnostics = {
                        Error = icons.diagnostics.error,
                        Warn = icons.diagnostics.warn,
                        Hint = icons.diagnostics.hint,
                        Info = icons.diagnostics.info,
                    },
                    git = {
                        enabled = true,
                        commit = icons.git.commit .. " ",
                        staged = icons.git.staged,
                        added = icons.git.added,
                        deleted = icons.git.deleted,
                        ignored = icons.git.ignored,
                        modified = icons.git.modified,
                        renamed = icons.git.renamed,
                        unmerged = icons.git.unmerged .. " ",
                        untracked = icons.git.untracked,
                    },
                },
            },
            indent = {
                enabled = true,
                scope = {
                    hl = "Label",
                },
            },
        },

        -- Key binds
        keys = {

            -- Key bind to close the current buffer
            {
                "<Leader>x",
                function() Snacks.bufdelete() end,
                mode = "n",
                desc = "Close the current buffer",
            },

            -- Key binds involving the Snacks picker
            {
                "<F1>",
                function() Snacks.picker.help() end,
                mode = { "n", "x", "i" },
                desc = "Search through the help text",
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
                desc = "Search through the open buffers",
            },
            {
                "<Leader>pr",
                function() Snacks.picker.registers() end,
                mode = "n",
                desc = "Search through Vim registers",
            },
            {
                "<Leader>pl",
                function() Snacks.picker.lines() end,
                mode = "n",
                desc = "Search through the lines in the current buffer",
            },
            {
                "<Leader>pi",
                function() Snacks.picker.pickers() end,
                mode = "n",
                desc = "Search through the list of pickers",
            },
            {
                "<Leader>/b",
                function() Snacks.picker.keymaps() end,
                mode = "n",
                desc = "Search through the list of key bindings",
            },
        },
    },
}
