-- Treesitter config

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up treesitter
local function setup()

    -- Stops executing if the package isn't installed
    if not utils.status_ok("nvim-treesitter.configs") then return end

    -- Setup the treesitter
    require("nvim-treesitter.configs").setup {

        -- A list of parser names
        ensure_installed = {
            "python",
            "markdown",
            "json",
            "org",
            "gitcommit",
            "html",
            "javascript",
            "typescript",

            -- These parsers should always be installed
            "c",
            "lua",
            "vim",
            "vimdoc",
            "query"
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
    config = setup,
    build = ":TSUpdate",
    cond = utils.firenvim_not_active,
    event = { "VeryLazy", "BufReadPost", "BufNewFile", "BufWritePre" },
    cmd = {
      "TSInstall",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSInstallInfo",
      "TSInstallSync",
      "TSInstallFromGrammar",
    },
    dependencies = {
        { "nvim-treesitter/nvim-treesitter-textobjects" }
    }
}
