-- Treesitter config

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up treesitter
local function treesitter_setup()

    -- Stops executing if the package isn't installed
    if not utils.status_ok("nvim-treesitter.configs") then return end

    -- Setup the treesitter
    require("nvim-treesitter.configs").setup {

        -- A list of parser names, or "all" (the last four parsers should always be installed)
        ensure_installed = {
            "python",
            "markdown",
            "json",
            "org",
            "c",
            "lua",
            "vim",
            "help"
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        highlight = {

            -- `false` will disable the whole extension
            enable = true,

            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
        },
    }

end

-- Returns the treesitter module for lazy.nvim
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    cond = utils.firenvim_not_active,
    event = "BufEnter",
    config = treesitter_setup
}
