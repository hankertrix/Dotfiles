-- Telescope configuration

-- Gets the module with the utilities
local utils = require("utils")

-- The table of descriptions
local descriptions = {
    find_file = "Find files using Telescope",
    search_string = "Search within files for a given string using Telescope",
    search_marked_file = "Search marked files using Telescope",
    search_code_symbols = "Search code symbols using Telescope",
}

-- Function to set up telescope
local function setup()
    --

    -- Stops executing if the packages aren't installed
    if not utils.status_ok("telescope", "trouble.sources.telescope") then
        return
    end

    -- Gets the telescope module
    local telescope = require("telescope")

    -- Gets the trouble module
    local trouble = require("trouble.sources.telescope")

    -- Set up telescope
    telescope.setup({
        defaults = {

            -- The default vimgrep arguments
            -- Add the hidden flag to find hidden files as well
            -- Add the trim flag to remove the indentation when searching
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "--hidden",
                "--trim",
            },

            -- Mappings to open the Telescope results with trouble
            mappings = {
                i = { ["<C-t>"] = trouble.open },
                n = { ["<C-t>"] = trouble.open },
            },
        },
    })

    -- Loads the fzf native extension
    telescope.load_extension("fzf")

    -- Loads the harpoon extension
    telescope.load_extension("harpoon")

    -- Loads the aerial extension
    telescope.load_extension("aerial")

    -- Gets the telescope module
    local builtin = require("telescope.builtin")

    -- Key maps that use the telescope fuzzy finder
    vim.keymap.set(
        "n",
        "<Leader>pf",
        builtin.find_files,
        { desc = descriptions["find_file"] }
    )
    vim.keymap.set(
        "n",
        "<Leader>ps",
        builtin.live_grep,
        { desc = descriptions["search_string"] }
    )

    -- Key map to search files that have been marked by harpoon
    vim.keymap.set(
        "n",
        "<Leader>ph",
        telescope.extensions.harpoon.marks,
        { desc = descriptions["search_marked_file"] }
    )

    -- Key map to search for code symbols
    vim.keymap.set(
        "n",
        "<Leader>pa",
        telescope.extensions.aerial.aerial,
        { desc = descriptions["search_code_symbols"] }
    )
end

-- Returns the telescope plugin for lazy.nvim
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
        {
            "<Leader>pa",
            mode = "n",
            desc = descriptions["search_code_symbols"],
        },
    },
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "aerial.nvim",
        "harpoon",
        "trouble.nvim",
    },
}
