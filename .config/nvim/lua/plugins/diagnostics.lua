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
        { "<Leader>tw", function() require("trouble").toggle("workspace_diagnostics") end, mode = "n", desc = "Display diagnostics for all open buffers in a Trouble window" },
        { "<Leader>tb", function() require("trouble").toggle("document_diagnostics") end, mode = "n", desc = "Display buffer diagnostics in a Trouble window" },
        { "<Leader>tq", function() require("trouble").toggle("quickfix") end, mode = "n", desc = "Display quick fix items in a Trouble window" },
        { "<Leader>tl", function() require("trouble").toggle("loclist") end, mode = "n", desc = "Display the window's location list items in a Trouble window" },
        { "gR", function() require("trouble").toggle("lsp_references") end, mode = "n", desc = "Display all references in a Trouble window" },
    }
}
