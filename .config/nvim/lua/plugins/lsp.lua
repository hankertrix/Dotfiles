-- LSP configuration

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up lsp-zero
local function lsp_setup()

    -- Stops executing if the packages aren't installed
    if not utils.status_ok({"lsp-zero", "cmp"}) then return end

    -- Gets the lsp module
    local lsp = require("lsp-zero")

    -- Sets the lsp preset to the recommended one
    lsp.preset("recommended")

    -- Ensure these LSP servers are installed
    lsp.ensure_installed({
        "lua_ls",
        "pylsp",
        "marksman",
        "ltex"
    })

    -- Set up the Lua LSP to be used for Neovim configuration
    lsp.nvim_workspace()

    -- Configure the ltex LSP
    lsp.configure("ltex", {
        settings = {
            ltex = {
                language = "en-GB"
            }
        }
    })

    -- Gets the shared configs file
    local shared_configs = require("shared_configs")

    -- Set up the completion sources
    local cmp_sources = {
        { name = "path" },
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lsp", keyword_length = 3 },
        { name = "cmp_tabnine" },
        { name = "buffer", keywword_length = 3 },
        { name = "treesitter", keyword_length = 3 },
        { name = "luasnip", keyword_length = 2 },
        { name = "calc" },
        { name = "emoji" },
    }


    -- The formatting for nvim-cmp
    local cmp_format = {
        fields = { "abbr", "kind", "menu" },
        format = function(entry, item)

            -- The list of kind icons
            local kind_icons = shared_configs.lsp_kind_icons

            -- Sets the item kind to the concatenation of the icon with the name of the item kind
            item.kind = string.format("%s %s", kind_icons[item.kind], item.kind)

            -- The menu name for the source of the completion
            local menu_name = shared_configs.source_names[entry.source.name] or utils.titlecase(entry.source.name)

            -- Sets the menu to the menu name enclosed in square brackets
            item.menu = string.format("[%s]", menu_name)

            -- Returns the item
            return item

        end
    }

    -- Set up the completion with my own settings
    lsp.setup_nvim_cmp({
        preselect = "item",
        mapping = shared_configs.default_cmp_mappings(),
        sources = cmp_sources,
        formatting = cmp_format
    })

    -- Set my sign icons for the LSP
    lsp.set_sign_icons(require("shared_configs").lsp_diagnostic_icons())

    -- Setup the LSP
    lsp.setup()

    -- Enable virtual_text
    vim.diagnostic.config({
        virtual_text = true,
    })

end


-- Returns the lsp-zero module for lazy.nvim
return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    cond = utils.firenvim_not_active,
    event = { "BufReadPre", "BufNewFile" },
    config = lsp_setup,
    dependencies = {

        -- LSP Support
        { "neovim/nvim-lspconfig" },             -- Required
        { "williamboman/mason.nvim" },           -- Optional
        { "williamboman/mason-lspconfig.nvim" }, -- Optional

        -- Autocompletion
        { "hrsh7th/nvim-cmp" },                  -- Required
        { "hrsh7th/cmp-nvim-lsp" },              -- Required

        -- Snippets
        { "L3MON4D3/LuaSnip" },                  -- Required
        { "rafamadriz/friendly-snippets" },      -- Optional
    }
}

