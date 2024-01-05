-- Configuration for the plugin to view diagnostics
-- Currently it's trouble.nvim

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up the diagnostics plugin
local function setup()

    -- Stops executing if the package isn't installed
    if not utils.status_ok("trouble") then return end

    -- Set up the diagnostics plugin
    require("trouble").setup {
        signs = require("shared_configs").lsp_kind_icons
    }
end

-- Return the diagnostics plugin for lazy.nvim
return {
    "folke/trouble.nvim",
    config = setup,
    cond = utils.firenvim_not_active,
    cmd = { "TroubleToggle", "Trouble" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<Leader>tt", function() require("trouble").toggle() end, mode = "n", desc = "Toggles the Trouble window" },
        { "<Leader>tw", function() require("trouble").toggle("workspace_diagnostics") end, mode = "n", desc = "Toggles the Trouble window for diagnostics in the current workspace (git repository)" },
        { "<Leader>tb", function() require("trouble").toggle("document_diagnostics") end, mode = "n", desc = "Toggles the Trouble window for diagnostics in the current buffer" },
        { "<Leader>tq", function() require("trouble").toggle("quickfix") end, mode = "n", desc = "Toggles the Trouble window for quickfix items" },
        { "<Leader>tl", function() require("trouble").toggle("quickfix") end, mode = "n", desc = "Toggles the Trouble window for the items in the window's location list" },
        { "gR", function() require("trouble").toggle("lsp_references") end, mode = "n", desc = "Toggles the Trouble window to display all references" },
    }
}
