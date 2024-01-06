-- Git plugin configuration
-- Currently it's vim-fugitive

-- Gets the module with the utilities
local utils = require("utils")

-- Returns the git plugin for lazy.nvim
return {
    "tpope/vim-fugitive",
    lazy = true,
    cond = utils.firenvim_not_active,
    cmd = "Git",
    keys = {

        -- The keybind to open Git
        { "<Leader>gs", vim.cmd.Git, mode = "n", desc = "Open Git" }
    },
    -- event = "User InGitRepo"
}

