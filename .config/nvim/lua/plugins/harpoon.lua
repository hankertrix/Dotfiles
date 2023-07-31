-- Harpoon configuration

-- Gets the module with the utilities
local utils = require("utils")

-- Function to setup up harpoon
local function harpoon_setup()

    -- Stops executing if the package isn't installed
    if not utils.status_ok("harpoon.mark") then return end

    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    -- Adds a file to the harpoon
    vim.keymap.set("n", "<Leader>ad", mark.add_file, { desc = "Adds a file to harpoon" })

    -- Ctrl + e opens a quick menu
    vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Toggles the harpoon menu" })

    -- Keymaps to quickly jump to the first few marked files
    vim.keymap.set("n", "<Leader>1", function() ui.nav_file(1) end, { desc = "Jump to the first marked file" })
    vim.keymap.set("n", "<Leader>2", function() ui.nav_file(2) end, { desc = "Jump to the second marked file" })
    vim.keymap.set("n", "<Leader>3", function() ui.nav_file(3) end, { desc = "Jump to the third marked file" })
    vim.keymap.set("n", "<Leader>4", function() ui.nav_file(4) end, { desc = "Jump to the fourth marked file" })

end

-- Returns the harpoon module for lazy.nvim
return {
    "theprimeagen/harpoon",
    cond = utils.firenvim_not_active,
    config = harpoon_setup,
    keys = {
        "<C-e>",
        "<Leader>ad",
        "<Leader>1",
        "<Leader>2",
        "<Leader>3",
        "<Leader>4"
    }
}

