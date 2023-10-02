-- LSP configuration

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up lsp-zero
local function lsp_setup()

    -- Stops executing if the packages aren't installed
    if not utils.status_ok({"lsp-zero", "cmp", "mason", "mason-lspconfig", "lspconfig"}) then return end

    -- Gets the lsp-zero module
    local lsp = require("lsp-zero")

    -- Initialise lsp-zero with the default key bindings
    lsp.on_attach(function(_, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
    end)

    -- Set up mason
    require("mason").setup()

    -- Set up mason lsp config
    require("mason-lspconfig").setup {

        -- Make sure the listed servers are always installed
        ensure_installed = {
            "lua_ls",
            "pylsp",
            "marksman",
            "ltex"
        },

        -- Use lsp-zero's default setup for all servers
        handlers = {
            lsp.default_setup,

            -- Set up lua ls for Neovim configuration
            lua_ls = function()

                -- Get the lua ls options from lsp-zero
                local lua_opts = lsp.nvim_lua_ls()
                require("lspconfig").lua_ls.setup(lua_opts)
            end,

            -- Configure ltex LSP
            ltex = function()
                require("lspconfig").ltex.setup {
                    settings = {
                        ltex = {
                            language = "en-GB"
                        }
                    }
                }
            end,

        }
    }

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
    require("cmp").setup({
        preselect = "item",
        mapping = shared_configs.default_cmp_mappings(),
        sources = cmp_sources,
        formatting = cmp_format,
        completion = {
            completeopt = "menu,menuone,noinsert"
        }
    })

    -- Set my sign icons for the LSP
    lsp.set_sign_icons(require("shared_configs").lsp_diagnostic_icons())

    -- Enable virtual_text
    vim.diagnostic.config({
        virtual_text = true,
    })

end


-- Returns the lsp-zero module for lazy.nvim
return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
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

