-- Fuzzy finder plugin configuration
-- Currently the fuzzy finder is fzf-lua

-- The fzf-lua separator
local separator = " ❯ "

-- Gets the module with the utilities
local utils = require("utils")

-- Returns the fuzzy finder plugin for lazy.nvim
return {
    "ibhagwan/fzf-lua",
    cond = utils.firenvim_not_active,
    lazy = true,
    cmd = "FzfLua",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
        "trouble.nvim",
    },
    config = function()
        --

        -- Get the fzf-lua actions for trouble
        local trouble_actions = require("trouble.sources.fzf").actions

        -- Set up fzf-lua
        require("fzf-lua").setup({

            -- Use the theme colours for the fzf window
            fzf_colors = true,

            git = {

                -- Use my own custom git icons
                icons = {
                    ["M"] = { icon = "󰛿", color = "blue" },
                    ["D"] = { icon = "󰚃", color = "red" },
                    ["A"] = { icon = "", color = "green" },
                    ["R"] = { icon = "", color = "red" },
                    ["?"] = { icon = "", color = "grey" },
                },

                -- Add a space to all the prompts
                files = {
                    prompt = "Git files" .. separator,
                },
                status = {
                    prompt = "Git status" .. separator,
                },
                commits = {
                    prompt = "Commits" .. separator,
                },
                bcommits = {
                    prompt = "Commits (current buffer)" .. separator,
                },
                blame = {
                    prompt = "Blame" .. separator,
                },
                branches = {
                    prompt = "Branches" .. separator,
                },
                tags = {
                    prompt = "Tags" .. separator,
                },
                stash = {
                    prompt = "Stash" .. separator,
                },
            },

            -- Use my custom lsp kind icons
            lsp = {
                symbols = {
                    symbol_icons = require("shared_configs").icons.lsp_kind,
                },

                -- Add a space to all the prompts
                prompt_postfix = separator,
                code_actions = {
                    prompt = "Code actions" .. separator,
                },
                finder = {
                    prompt = "LSP finder" .. separator,
                },
            },

            keymap = {

                builtin = {

                    -- Inherit the default mappings
                    true,
                    ["<C-j>"] = "preview-page-down",
                    ["<C-k>"] = "preview-page-up",
                    ["<M-j>"] = "preview-down",
                    ["<M-k>"] = "preview-up",
                },

                fzf = {

                    -- Inherit the default mappings
                    true,
                    ["ctrl-j"] = "preview-down",
                    ["ctrl-k"] = "preview-up",
                },
            },

            actions = {
                files = {

                    -- Inherit the default mappings
                    true,

                    -- Ctrl + d for diagnostics,
                    -- since trouble is for diagnostics
                    ["ctrl-d"] = trouble_actions.open,
                },
            },

            -- Add a space for all the prompts
            files = {
                prompt = "Files" .. separator,
            },
            grep = {
                prompt = "Grep" .. separator,
                input_prompt = "Grep for: ",
            },
            args = {
                prompt = "Argument list" .. separator,
            },
            oldfiles = {
                prompt = "History" .. separator,
            },
            buffers = {
                prompt = "Buffers" .. separator,
            },
            tabs = {
                prompt = "Tabs" .. separator,
            },
            lines = {
                prompt = "Lines" .. separator,
            },
            blines = {
                prompt = "Lines (current buffer)" .. separator,
            },
            tags = {
                prompt = "Tags" .. separator,
            },
            btags = {
                prompt = "Tags (current buffer)" .. separator,
            },
            colorschemes = {
                prompt = "Colorschemes" .. separator,
            },
            awesome_colorschemes = {
                prompt = "Awesome colorschemes" .. separator,
            },
            keymaps = {
                prompt = "Keymaps" .. separator,
            },
            quickfix_stack = {
                prompt = "Quickfix stack" .. separator,
            },
            diagnostics = {
                prompt = "Diagnostics" .. separator,
            },
        })
    end,
    keys = {
        {
            "<F1>",
            function() require("fzf-lua").helptags() end,
            mode = { "n", "x", "i" },
            desc = "Search through the help text using the fuzzy finder",
        },
        {
            "<Leader>pf",
            function() require("fzf-lua").files() end,
            mode = "n",
            desc = "Find files using the fuzzy finder",
        },
        {
            "<Leader>ps",
            function() require("fzf-lua").live_grep() end,
            mode = "n",
            desc = "Search within files for a string",
        },
        {
            "<Leader>pb",
            function() require("fzf-lua").buffers() end,
            mode = "n",
            desc = "Search for open buffers using the fuzzy finder",
        },
        {
            "<Leader>pr",
            function() require("fzf-lua").registers() end,
            mode = "n",
            desc = "Search through vim registers",
        },
    },
}
