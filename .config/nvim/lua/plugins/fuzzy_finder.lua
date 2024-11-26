-- Fuzzy finder plugin configuration
-- Currently the fuzzy finder is fzf-lua

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
                    ["ctrl-d"] = trouble_actions.open,
                },
            },
        })
    end,
    keys = {
        {
            "<F1>",
            function()
                require("fzf-lua").helptags()
            end,
            mode = { "n", "x", "i" },
            desc = "Search through the help text using the fuzzy finder",
        },
        {
            "<Leader>pf",
            function()
                require("fzf-lua").files()
            end,
            mode = "n",
            desc = "Find files using the fuzzy finder",
        },
        {
            "<Leader>ps",
            function()
                require("fzf-lua").live_grep()
            end,
            mode = "n",
            desc = "Search within files for a string",
        },
        {
            "<Leader>pb",
            function()
                require("fzf-lua").buffers()
            end,
            mode = "n",
            desc = "Search for open buffers using the fuzzy finder",
        },
        {
            "<Leader>pr",
            function()
                require("fzf-lua").registers()
            end,
            mode = "n",
            desc = "Search through vim registers",
        },
    },
}
