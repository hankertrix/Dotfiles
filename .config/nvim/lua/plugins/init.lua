-- Plugins that don't require configuration

-- Gets the module with the utilities
local utils = require("utils")

-- Returns the list of plugins for lazy.nvim
return {

    -- Plugin to automatically detect shift width and tabstop
    {
        "tpope/vim-sleuth",
        lazy = true,
        event = "InsertEnter",
        cond = utils.firenvim_not_active
    },

    -- Markdown previewer
    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
        lazy = true,
        cond = utils.firenvim_not_active,
        ft = "markdown"
    },

    -- Vim Be Good game to practice Vim motions
    {
        "ThePrimeagen/vim-be-good",
        lazy = true,
        cmd = "VimBeGood"
    }
}
