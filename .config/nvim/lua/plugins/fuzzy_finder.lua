-- Fuzzy finder plugin configuration
-- Currently the fuzzy finder is fzf-lua

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up the fuzzy finder
local function setup()
    --

    -- Get the configuration for fzf-lua
    local fzf_lua_config = require("fzf-lua.config")

    -- Get the fzf-lua actions for trouble
    local trouble_actions = require("trouble.sources.fzf").actions

    -- Set Ctrl - t to open the results in trouble
    fzf_lua_config.defaults.actions.files["ctrl-t"] = trouble_actions.open
end

-- Returns the fuzzy finder plugin for lazy.nvim
return {
    "ibhagwan/fzf-lua",
    config = setup,
    cond = utils.firenvim_not_active,
    lazy = true,
    cmd = "FzfLua",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
    },
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
            "<Leader>pa",
            function()
                require("fzf-lua").lsp_document_symbols()
            end,
            mode = "n",
            desc = "Search for code symbols using the fuzzy finder",
        },
    },
}
