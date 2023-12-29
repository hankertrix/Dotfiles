-- Git Fugitive configuration

-- Gets the module with the utilities
local utils = require("utils")

-- Set a key map to open Git
vim.keymap.set("n", "<Leader>gs", vim.cmd.Git, { desc = "Opens Git" })

-- The function to configure vim-fugitive
local function fugitive_config()

    -- Set the highlight groups to the correct colours
    vim.api.nvim_set_hl(0, "diffAdded", { link = "DiffviewStatusAdded" })
    vim.api.nvim_set_hl(0, "diffRemoved", { link = "DiffviewStatusDeleted" })

end


-- Returns the fugitive module for lazy.nvim
return {
    "tpope/vim-fugitive",
    cmd = "Git",
    lazy = true,
    cond = utils.firenvim_not_active,
    config = fugitive_config
    -- event = "User InGitRepo"
}

