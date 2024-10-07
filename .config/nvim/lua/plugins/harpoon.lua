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

-- Returns the harpoon plugin for lazy.nvim
return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    cond = utils.firenvim_not_active,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
        {
            "<C-e>",
            function()
                local harpoon = require("harpoon")
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end,
            mode = "n",
            desc = descriptions["toggle"],
        },
        {
            "<Leader>ad",
            function()
                require("harpoon"):list():append()
            end,
            mode = "n",
            desc = descriptions["add_file"],
        },
        {
            "<Leader>1",
            function()
                require("harpoon"):list():select(1)
            end,
            mode = "n",
            desc = descriptions["first_file"],
        },
        {
            "<Leader>2",
            function()
                require("harpoon"):list():select(2)
            end,
            mode = "n",
            desc = descriptions["second_file"],
        },
        {
            "<Leader>3",
            function()
                require("harpoon"):list():select(3)
            end,
            mode = "n",
            desc = descriptions["third_file"],
        },
        {
            "<Leader>4",
            function()
                require("harpoon"):list():select(4)
            end,
            mode = "n",
            desc = descriptions["fourth_file"],
        },
    },
}
