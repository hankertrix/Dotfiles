-- Harpoon configuration

-- Gets the module with the utilities
local utils = require("utils")

-- The table of descriptions
local descriptions = {
    add_file = "Add a file to harpoon",
    toggle = "Toggle the harpoon menu",
    first_file = "Jump to the 1st marked file",
    second_file = "Jump to the 2nd marked file",
    third_file = "Jump to the 3rd marked file",
    fourth_file = "Jump to the 4th marked file",
}

-- Function to setup up harpoon
local function setup()

    -- Stops executing if the package isn't installed
    if not utils.status_ok("harpoon") then return end

    -- Gets the harpoon plugin
    local harpoon = require("harpoon")

    -- Call harpoon's setup function
    harpoon:setup()

    -- Ctrl + e opens a quick menu
    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = descriptions["toggle"] })

    -- Adds a file to the harpoon
    vim.keymap.set("n", "<Leader>ad", function() harpoon:list():append() end, { desc = descriptions["add_file"] })

    -- Keymaps to quickly jump to the first few marked files
    vim.keymap.set("n", "<Leader>1", function() harpoon:list():select(1) end, { desc = descriptions["first_file"] })
    vim.keymap.set("n", "<Leader>2", function() harpoon:list():select(2) end, { desc = descriptions["second_file"] })
    vim.keymap.set("n", "<Leader>3", function() harpoon:list():select(3) end, { desc = descriptions["third_file"] })
    vim.keymap.set("n", "<Leader>4", function() harpoon:list():select(4) end, { desc = descriptions["fourth_file"] })

end

-- Returns the harpoon plugin for lazy.nvim
return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    cond = utils.firenvim_not_active,
    config = setup,
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<C-e>", mode = "n", desc = descriptions["toggle"] },
        { "<Leader>ad", mode = "n", desc = descriptions["add_file"] },
        { "<Leader>1", mode = "n", desc = descriptions["first_file"] },
        { "<Leader>2", mode = "n", desc = descriptions["second_file"] },
        { "<Leader>3", mode = "n", desc = descriptions["third_file"] },
        { "<Leader>4", mode = "n", desc = descriptions["fourth_file"] },
    }
}

