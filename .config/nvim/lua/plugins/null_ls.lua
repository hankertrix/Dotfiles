-- Null-ls configuration

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up null-ls
local function setup()

    -- Stops executing if the packages aren't installed
    if not utils.status_ok({ "mason-null-ls", "null-ls" }) then return end

    -- Gets the null-ls module
    local null_ls = require("null-ls")

    -- Set up null-ls
    null_ls.setup {

        sources = {

            -- Formatters

            -- Lua
            null_ls.builtins.formatting.stylua,

            -- JavaScript ecosystem
            null_ls.builtins.formatting.prettierd.with {
                prefer_local = "node_modules/.bin",
                extra_filetypes = { "svelte" }
            },


            -- Linters

            -- Shell scripts
            null_ls.builtins.diagnostics.shellcheck,
            null_ls.builtins.code_actions.shellcheck,

            -- JavaScript ecosystem
            null_ls.builtins.diagnostics.eslint_d.with {
                extra_filetypes = { "svelte" }
            },
            null_ls.builtins.code_actions.eslint_d.with {
                extra_filetypes = { "svelte" }
            },


            -- Miscellaneous
            null_ls.builtins.code_actions.gitsigns
        }
    }

    -- Set up mason-null-ls
    require("mason-null-ls").setup {

        -- Ensure nothing is installed (use null-ls configuration)
        ensure_installed = nil,

        -- Automatically install based on the null-ls configuration
        automatic_installation = true,
    }

end

-- Returns the mason-null-ls plugin to lazy.nvim
return {
    "jay-babu/mason-null-ls.nvim",
    config = setup,
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    lazy = true,
    dependencies = {
        "mason.nvim",
        { "nvimtools/none-ls.nvim", dependencies = "gitsigns.nvim" }
    }
}
