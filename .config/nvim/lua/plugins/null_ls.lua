-- Null-ls configuration

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up null-ls
local function setup()
    --

    -- Gets the null-ls module
    local null_ls = require("null-ls")

    -- Set up null-ls
    null_ls.setup({

        sources = {

            -- Miscellaneous
            null_ls.builtins.code_actions.gitsigns,
        },
    })
end

-- Returns the none-ls plugin to lazy.nvim
return {
    "nvimtools/none-ls.nvim",
    cond = utils.firenvim_not_active,
    config = setup,
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    lazy = true,
    dependencies = {
        "mason.nvim",
        "gitsigns.nvim",
    },
}
