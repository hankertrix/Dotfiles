-- Telescope configuration

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up telescope
local function telescope_setup()

    -- Stops executing if the package isn't installed
    if not utils.status_ok("telescope") then return end

    -- Gets the telescope module
    local telescope = require("telescope")


    -- Set up telescope
    telescope.setup()

    -- Loads the fzf native extension
    telescope.load_extension("fzf")

    -- Loads the harpoon extension
    telescope.load_extension("harpoon")

    -- Loads the aerial extension
    telescope.load_extension("aerial")

    -- Gets the telescope module
    local builtin = require("telescope.builtin")

    -- Key maps that use the telescope fuzzy finder
    vim.keymap.set("n", "<Leader>pf", builtin.find_files, { desc = "Find files with Telescope" })
    vim.keymap.set("n", "<Leader>ps", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") });
    end, { desc = "Search within files for a given string using Telescope" })

    -- Key map to search files that have been marked by harpoon
    vim.keymap.set("n", "<Leader>ph", telescope.extensions.harpoon.marks, { desc = "Search marked files" })

    -- Key map to search for code symbols
    vim.keymap.set("n", "<Leader>pa", telescope.extensions.aerial.aerial, { desc = "Search code symbols" })

end

-- Returns the telescope module for lazy.nvim
return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    cond = utils.firenvim_not_active,
    lazy = true,
    keys = { "<Leader>pf", "<Leader>ps", "<Leader>ph", "<Leader>pa" },
    config = telescope_setup,
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { "theprimeagen/harpoon" },
        { "stevearc/aerial.nvim" },
    }
}

