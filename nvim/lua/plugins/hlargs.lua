-- Configuration for hlargs

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up hlargs
local function hlargs_setup()

    -- Stops executing if the package isn't installed
    if not utils.status_ok("hlargs") then return end

    -- Set up hlargs
    require("hlargs").setup()

end

-- Returns the hlargs module for lazy.nvim
return {
    "m-demare/hlargs.nvim",
    cond = utils.firenvim_not_active,
    event = "VeryLazy",
    config = hlargs_setup,
    dependencies = { "nvim-treesitter/nvim-treesitter" }
}
