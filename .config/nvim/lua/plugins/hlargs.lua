-- Configuration for hlargs

-- Gets the module with the utilities
local utils = require("utils")

-- Returns the hlargs plugin for lazy.nvim
return {
    "m-demare/hlargs.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {},
}
