-- Harpoon configuration

-- Gets the module with the utilities
local utils = require("utils")

-- Function to setup up harpoon
local function harpoon_setup()

    -- Stops executing if the package isn't installed
    if not utils.status_ok("harpoon") then return end

    -- Gets the harpoon plugin
    local harpoon = require("harpoon")

    -- Call harpoon's setup function
    harpoon:setup()

    -- Adds a file to the harpoon
    vim.keymap.set("n", "<Leader>ad", function() harpoon:list():append() end, { desc = "Adds a file to harpoon" })

    -- Ctrl + e opens a quick menu
    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggles the harpoon menu" })

    -- Keymaps to quickly jump to the first few marked files
    vim.keymap.set("n", "<Leader>1", function() harpoon:list():select(1) end, { desc = "Jump to the 1st marked file" })
    vim.keymap.set("n", "<Leader>2", function() harpoon:list():select(2) end, { desc = "Jump to the 2nd marked file" })
    vim.keymap.set("n", "<Leader>3", function() harpoon:list():select(3) end, { desc = "Jump to the 3rd marked file" })
    vim.keymap.set("n", "<Leader>4", function() harpoon:list():select(4) end, { desc = "Jump to the 4th marked file" })

end

-- Returns the harpoon module for lazy.nvim
return {
    "theprimeagen/harpoon",
    cond = utils.firenvim_not_active,
    config = harpoon_setup,
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        "<C-e>",
        "<Leader>ad",
        "<Leader>1",
        "<Leader>2",
        "<Leader>3",
        "<Leader>4"
    }
}

