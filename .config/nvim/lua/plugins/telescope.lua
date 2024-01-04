-- Telescope configuration

-- Gets the module with the utilities
local utils = require("utils")

-- The table of descriptions
local descriptions = {
    ["find_file"] = "Find files with Telescope",
    ["search_string"] = "Search within files for a given string using Telescope",
    ["search_marked_file"] = "Search marked files",
    ["search_code_symbols"] = "Search code symbols",
}

-- Function to set up telescope
local function setup()

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
    vim.keymap.set("n", "<Leader>pf", builtin.find_files, { desc = descriptions["find_file"] })
    vim.keymap.set("n", "<Leader>ps", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") });
    end, { desc = descriptions["search_string"] })

    -- Key map to search files that have been marked by harpoon
    vim.keymap.set("n", "<Leader>ph", telescope.extensions.harpoon.marks, { desc = descriptions["search_marked_file"] })

    -- Key map to search for code symbols
    vim.keymap.set("n", "<Leader>pa", telescope.extensions.aerial.aerial, { desc = descriptions["search_code_symbols"] })

end

-- Returns the telescope module for lazy.nvim
return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    config = setup,
    cond = utils.firenvim_not_active,
    lazy = true,
    cmd = "Telescope",
    keys = {
        { "<Leader>pf", mode = "n", desc = descriptions["find_file"] },
        { "<Leader>ps", mode = "n", desc = descriptions["search_string"] },
        { "<Leader>ph", mode = "n", desc = descriptions["search_marked_file"] },
        { "<Leader>pa", mode = "n", desc = descriptions["search_code_symbols"] }
    },
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { "stevearc/aerial.nvim" },
        "harpoon"
    }
}

