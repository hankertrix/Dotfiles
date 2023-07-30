-- Git Fugitive configuration

-- Gets the module with the utilities
local utils = require("utils")

vim.keymap.set("n", "<Leader>gs", vim.cmd.Git, { desc = "Opens Git" })

-- Returns the fugitive module for lazy.nvim
return {
    "tpope/vim-fugitive",
    cmd = "Git",
    lazy = true,
    cond = utils.firenvim_not_active,
    -- event = "User InGitRepo"
}

