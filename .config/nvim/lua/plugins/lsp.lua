-- LSP configuration

-- Gets the module with the utilities
local utils = require("utils")

-- The table of descriptions
local descriptions = {
    hover = "Show hover information",
    definition = "Go to definition",
    declaration = "Go to declaration",
    implementation = "List all implementations in a quickfix window",
    type_definition = "Go to the definition of the type",
    references = "List all references in a quickfix window",
    signature_help = "Show signature information",
    rename = "Renames all references to the symbol under the cursor",
    format = "Formats the buffer using the LSP",
    code_action = "Select a code action",
    diagnostic_window = "Show diagnostics in a floating window",
    diagnostic_prev = "Go to the previous diagnostic",
    diagnostic_next = "Go to the next diagnostic",
}

-- The list of root files
local root_files = {

    -- Default root files from lspconfig
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",

    -- Wezterm configuration file
    "wezterm.lua",

    -- Awesomewm configuration file
    "rc.lua",

    -- Yazi init.lua file
    "init.lua",
}


-- Function to set up lsp-zero
local function setup()

    -- Stops executing if the packages aren't installed
    if not utils.status_ok({ "lsp-zero", "cmp", "mason", "mason-lspconfig", "lspconfig" }) then return end

    -- Gets the lsp-zero module
    local lsp = require("lsp-zero")

    -- Gets the lspconfig module
    local lspconfig = require("lspconfig")

    -- Initialise lsp-zero with my key bindings
    lsp.on_attach(function(_, bufnr)

        -- The options for the key mappings
        local opts = { buffer = bufnr, remap = false }

        -- LSP key bindings
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts, { desc = descriptions["hover"] })
        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts, { desc = descriptions["definition"] })
        vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts, { desc = descriptions["declaration"] })
        vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts, { desc = descriptions["implementation"] })
        vim.keymap.set('n', 'go', function() vim.lsp.buf.type_definition() end, opts, { desc = descriptions["type_definition"] })
        vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts, { desc = descriptions["references"] })
        vim.keymap.set('n', 'gs', function() vim.lsp.buf.signature_help() end, opts, { desc = descriptions["signature_help"] })
        vim.keymap.set('n', '<F2>', function() vim.lsp.buf.rename() end, opts, { desc = descriptions["rename"] })
        vim.keymap.set({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end, opts, { desc = descriptions["format"] })
        vim.keymap.set({ 'n', 'x' }, '<Leader>f', function() vim.lsp.buf.format({ async = true }) end, opts, { desc = descriptions["format"] })
        vim.keymap.set('n', '<F4>', function() vim.lsp.buf.code_action() end, opts, { desc = descriptions["code_action"] })

        -- If a range is selected and a range code action is available, use the range code action
        if vim.lsp.buf.range_code_action then
            vim.keymap.set('x', '<F4>', function() vim.lsp.buf.range_code_action() end, opts, { desc = descriptions["code_action"] })
        else
            vim.keymap.set('x', '<F4>', function() vim.lsp.buf.code_action() end, opts, { desc = descriptions["code_action"] })
        end

        -- Diagnostic key bindings
        vim.keymap.set('n', 'gl', function() vim.diagnostic.open_float() end, opts, { desc = descriptions["diagnostic_window"] })
        vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts, { desc = descriptions["diagnostic_prev"] })
        vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts, { desc = descriptions["diagnostic_next"] })
    end)

    -- Gets the shared configs file
    local shared_configs = require("shared_configs")

    -- Set up mason lsp config
    require("mason-lspconfig").setup {

        -- The handlers for the various LSPs
        handlers = {

            -- Use lsp-zero's default setup for all servers
            lsp.default_setup,

            -- Configure lua ls
            lua_ls = function()

                -- Gets the runtime path for Neovim
                -- Comment out when configuring other applications, like awesomewm or wezterm
                local runtime_path = vim.split(package.path, ';')
                table.insert(runtime_path, 'lua/?.lua')
                table.insert(runtime_path, 'lua/?/init.lua')

                -- Set up lua ls using lspconfig
                lspconfig.lua_ls.setup {

                    -- Set the root directory
                    root_dir = function(fname)

                        -- Tries to get the root directory
                        local root = lspconfig.util.root_pattern(unpack(root_files))(fname)

                        -- If the root directory exists
                        -- and is not the Neovim configuration directory
                        if root and root ~= vim.env.HOME then

                            -- Then immediately return the root directory
                            return root
                        end

                        -- Otherwise, tries to find the lua folder in the
                        -- Neovim configuration directory
                        root = lspconfig.util.root_pattern('lua/')(fname)

                        -- If the root directory is found
                        if root then

                            -- Then return the lua folder in the
                            -- Neovim configuration directory
                            return root .. '/lua/'
                        end

                        -- Otherwise, tries to find the nearest git repository
                        return lspconfig.util.find_git_ancestor(fname)
                    end,

                    settings = {
                        Lua = {

                            -- Disable telemetry
                            telemetry = { enable = false },

                            -- Tell the language server which version of Lua is being used
                            -- LuaJIT in the case of Neovim
                            runtime = {
                                version = "LuaJIT",

                                -- Comment out when configuring other applications, like awesomewm or wezterm
                                path = runtime_path
                            },

                            diagnostics = {

                                -- Get the language server to recognise the vim global
                                globals = { "vim" }
                            },

                            workspace = {
                                checkThirdParty = false,
                                library = {

                                    -- Make the server aware of Neovim runtime files
                                    vim.fn.expand('$VIMRUNTIME/lua'),
                                    vim.fn.stdpath('config') .. '/lua'
                                }
                            }
                        }
                    }
                }
            end,

            -- Configure pylsp
            pylsp = function()
                lspconfig.pylsp.setup {
                    settings = {
                        pylsp = {
                            plugins = {

                                -- Configure the pycodestyle plugin
                                pycodestyle = {
                                    maxLineLength = shared_configs.max_line_length
                                },

                                -- Configure the black plugin
                                black = {
                                    line_length = shared_configs.max_line_length
                                }
                            }
                        }
                    }
                }
            end,

            -- Configure ltex LSP
            ltex = function()
                lspconfig.ltex.setup {
                    settings = {
                        ltex = {
                            language = "en-GB"
                        }
                    }
                }
            end,

        }
    }

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


-- Returns the lsp-zero plugin for lazy.nvim
return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    config = setup,
    cond = utils.firenvim_not_active,
    event = { "BufReadPre", "BufNewFile" },

    keys = {
        { "K", mode = "n", desc = descriptions["hover"] },
        { "gd", mode = "n", desc = descriptions["definition"] },
        { "gD", mode = "n", desc = descriptions["declaration"] },
        { "gi", mode = "n", desc = descriptions["implementation"] },
        { "go", mode = "n", desc = descriptions["type_definition"] },
        { "gr", mode = "n", desc = descriptions["references"] },
        { "gs", mode = "n", desc = descriptions["signature_help"] },
        { "<F2>", mode = "n", desc = descriptions["rename"] },
        { "<F3>", mode = { "n", "x" }, desc = descriptions["format"] },
        { "<Leader>f", mode =  { "n", "x" }, desc = descriptions["format"] },
        { "<F4>", mode = { "n", "x" }, desc = descriptions["code_action"] },
        { "gl", mode = "n", desc = descriptions["diagnostic_window"] },
        { "[d", mode = "n", desc = descriptions["diagnostic_prev"] },
        { "]d", mode = "n", desc = descriptions["diagnostic_next"] },
    },

    dependencies = {

        -- LSP Support
        { "neovim/nvim-lspconfig" },
        "mason.nvim",
        { "williamboman/mason-lspconfig.nvim", dependencies = "mason.nvim" },


        -- Autocompletion
        "nvim-cmp",
        "cmp-nvim-lsp",

        -- Snippets
        { "L3MON4D3/LuaSnip", event = "InsertEnter" },
        { "rafamadriz/friendly-snippets" },
    }
}

