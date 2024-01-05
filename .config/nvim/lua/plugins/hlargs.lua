-- Configuration for hlargs

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up hlargs
local function setup()

    -- Stops executing if the package isn't installed
    if not utils.status_ok("hlargs") then return end

    -- Set up hlargs
    require("hlargs").setup()

end

-- Returns the hlargs plugin for lazy.nvim
return {
    "m-demare/hlargs.nvim",
    config = setup,
    cond = utils.firenvim_not_active,
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = { "nvim-treesitter/nvim-treesitter" }
}
