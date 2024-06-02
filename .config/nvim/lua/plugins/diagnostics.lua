-- Configuration for the plugin to view diagnostics
-- Currently it's trouble.nvim

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up the diagnostics plugin
local function setup()

    -- Stops executing if the package isn't installed
    if not utils.status_ok("trouble") then return end

    -- Set up the diagnostics plugin
    require("trouble").setup({
        kinds = require("shared_configs").lsp_kind_icons,
    })
end

-- Return the diagnostics plugin for lazy.nvim
return {
    "folke/trouble.nvim",
    config = setup,
    cond = utils.firenvim_not_active,
    cmd = { "TroubleToggle", "Trouble" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        {
            "<Leader>tr",
            "<cmd>Trouble diagnostics toggle<cr>",
            mode = "n",
            desc = "Toggles the Trouble window",
        },
        {
            "<Leader>tb",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            mode = "n",
            desc = "Display buffer diagnostics in a Trouble window",
        },
        {
            "<Leader>tq",
            "<cmd>Trouble qflist toggle<cr>",
            mode = "n",
            desc = "Display quick fix items in a Trouble window",
        },
        {
            "<Leader>tl",
            "<cmd>Trouble loclist toggle<cr>",
            mode = "n",
            desc = "Display the window's location list items in a Trouble window",
        },
        {
            "gR",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            mode = "n",
            desc = "Display all references in a Trouble window",
        },
    },
}
