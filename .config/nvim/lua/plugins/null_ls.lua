-- Null-ls configuration

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up null-ls
local function setup()

    -- Stops executing if the packages aren't installed
    if not utils.status_ok({
        "mason-null-ls",
        "null-ls",
        "cspell"
    }) then return end

    -- Gets the null-ls module
    local null_ls = require("null-ls")

    -- Gets the CSpell module
    local cspell = require("cspell")

    -- The CSpell config
    local cspell_config = {

        -- Set the severity of CSpell to hint
        diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity["HINT"]
        end,

        -- The actual configuration for CSpell
        config = {

            -- Format the JSON file when adding to the CSpell config file
            on_add_to_json = function(payload)
                os.execute(
                    string.format(
                        "cat %s | jq -S '.words |= sort' | tee %s > /dev/null",
                        payload.cspell_config_path,
                        payload.cspell_config_path
                    )
                )
            end
        },
    }

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

            -- Code spelling
            cspell.diagnostics.with(cspell_config),
            cspell.code_actions.with(cspell_config),


            -- Miscellaneous
            null_ls.builtins.code_actions.gitsigns
        }
    }

    -- Set up mason-null-ls
    require("mason-null-ls").setup {

        -- Ensure nothing is installed (use null-ls configuration)
        ensure_installed = nil,

        -- Don't automatically install based on the null-ls configuration
        -- Use mason tool installer instead
        automatic_installation = false,
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
        {
            "nvimtools/none-ls.nvim",
            dependencies = { "gitsigns.nvim", "davidmh/cspell.nvim" }
        }
    }
}
