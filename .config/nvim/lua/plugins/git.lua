-- Git plugin configuration
-- Currently it's vim-fugitive

-- Gets the module with the utilities
local utils = require("utils")

-- Function to configure the git plugin
local function setup()

    -- Set the highlight groups to the correct colours
    vim.api.nvim_set_hl(0, "diffAdded", { link = "DiffviewStatusAdded" })
    vim.api.nvim_set_hl(0, "diffRemoved", { link = "DiffviewStatusDeleted" })

end

-- Returns the plugin module for lazy.nvim
return {
    "tpope/vim-fugitive",
    config = setup,
    lazy = true,
    cond = utils.firenvim_not_active,
    cmd = "Git",
    keys = {

        -- The keybind to open Git
        { "<Leader>gs", vim.cmd.Git, mode = "n", desc = "Open Git" }
    },
    -- event = "User InGitRepo"
}

