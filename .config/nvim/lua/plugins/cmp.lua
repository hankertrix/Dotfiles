-- Completion engine configuration
-- Currently using blink.cmp

-- Function to set up the completion engine
local function setup()
    --

    -- Get the completion engine
    local cmp = require("blink.cmp")

    -- Get the shared configuration
    local shared_configs = require("shared_configs")

    -- Get the utilities module
    local utils = require("utils")

    -- The list of source names for the completion engine
    local source_names = {
        cmp_tabnine = "TabNine",
        cmdline = "Command Line",
    }

    -- Set up Supermaven for AI autocompletion
    require("supermaven-nvim").setup({
        log_level = "info",
        disable_inline_completion = true,
        disable_keymaps = true,
    })

    -- Setup the completion engine
    require("blink.cmp").setup({

        -- Sources configuration
        sources = {

            -- Default sources
            default = {
                "lsp",
                "path",
                "snippets",
                "buffer",
                "supermaven",
                "tabnine",
                "spell",
                "calc",
                "emoji",
            },

            -- Configuration for the providers
            providers = {
                supermaven = {
                    name = "supermaven",
                    module = "blink.compat.source",
                    enabled = utils.firenvim_not_active,
                },
                tabnine = {
                    name = "cmp_tabnine",
                    module = "blink.compat.source",
                    enabled = utils.firenvim_not_active,
                },
                spell = {
                    name = "spell",
                    module = "blink-cmp-spell",
                    enabled = function()
                        return vim.bo.filetype == "text"
                            or not utils.firenvim_not_active()
                    end,
                    score_offset = -5,
                },
                calc = {
                    name = "calc",
                    module = "blink.compat.source",
                    score_offset = -10,
                },
                emoji = {
                    name = "emoji",
                    module = "blink-emoji",
                    score_offset = -15,
                    opts = { insert = true },
                },
            },
        },

        -- Key bindings
        keymap = {

            -- Don't inherit the default mappings
            preset = "none",

            -- Use Vim's default scrolling to scroll
            -- the documentation in the completion menu
            ["<C-d>"] = {
                function(cmp) cmp.scroll_documentation_down(5) end,
                "fallback",
            },
            ["<C-u>"] = {
                function(cmp) cmp.scroll_documentation_up(5) end,
                "fallback",
            },
            ["<C-f>"] = {
                function(cmp) cmp.scroll_documentation_down(10) end,
                "fallback",
            },
            ["<C-b>"] = {
                function(cmp) cmp.scroll_documentation_up(10) end,
                "fallback",
            },

            -- Use up and down arrow keys to select the previous
            -- and next item respectively
            ["<Up>"] = { "select_prev", "fallback" },
            ["<Down>"] = { "select_next", "fallback" },

            -- Ctrl + p and Ctrl + n work similarly
            -- to the up and down arrow keys
            ["<C-p>"] = { "select_prev", "fallback" },
            ["<C-n>"] = { "select_next", "fallback" },

            -- Super tab
            ["<Tab>"] = {

                -- Use tab to complete
                function(cmp)
                    --

                    -- If the snippet is active, accept it
                    if cmp.snippet_active() then
                        return cmp.accept()

                    -- Otherwise, select and accept the next item
                    else
                        return cmp.select_and_accept()
                    end
                end,

                -- Use tab to advance the snippet as well
                "snippet_forward",
                "fallback",
            },

            -- Use Shift + Tab to move backwards in a snippet
            ["<S-Tab"] = { "snippet_backward", "fallback" },

            -- Use Ctrl + y to select and accept
            ["<C-y>"] = { "select_and_accept" },

            -- Use Ctrl + e to exit the cmp menu
            ["<C-e>"] = { "cancel", "fallback" },

            -- Vim's default mapping for completions
            ["<C-Space>"] = { "show" },
        },

        -- Completion configuration
        completion = {

            -- Never fill in brackets
            accept = { auto_brackets = { enabled = false } },

            -- Configure the completion menu
            menu = {
                draw = {
                    columns = {
                        { "kind_icon" },
                        { "label", "label_description", gap = 1 },
                        { "kind" },
                        { "source_name" },
                    },

                    -- Configure the components
                    components = {

                        -- Have a space between the label and the label detail
                        label = {
                            text = function(ctx)
                                return string.format(
                                    "%s %s",
                                    vim.trim(ctx.label),
                                    vim.trim(ctx.label_detail)
                                )
                            end,
                        },

                        -- Get the source name from the source name dictionary,
                        -- otherwise, replace all the underscores and dashes
                        -- with spaces and title case the source name.
                        source_name = {
                            text = function(ctx)
                                local source_name = ctx.source_name
                                return source_names[source_name:lower()]
                                    or utils.titlecase(
                                        source_name:gsub("[_%-]", " ")
                                    )
                            end,
                        },
                    },
                },
            },

            list = {
                selection = {

                    -- Change the preselect behaviour to only work
                    -- when the snippet is not active
                    preselect = function()
                        return not cmp.snippet_active({ direction = 1 })
                    end,
                },
            },

            -- Show documentation automatically
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
            },
        },

        -- Enable signature help
        signature = {
            enabled = true,
        },

        -- Fuzzy finder configuration
        fuzzy = {

            -- Set label as the primary source for the spell source
            sorts = {
                function(item_1, item_2)
                    local sort = require("blink.cmp.fuzzy.sort")
                    if
                        item_1.source_id == "spell"
                        and item_2.source_id == "spell"
                    then
                        return sort.label(item_1, item_2)
                    end
                end,

                -- Default order to fall back on
                "score",
                "sort_text",
            },
        },

        -- Configuration for the appearance
        appearance = {
            nerd_font_variant = "mono",
            kind_icons = shared_configs.icons.lsp_kind,
        },
    })
end

-- Returns the completion engine for lazy.nvim
return {
    "Saghen/blink.cmp",
    version = "*",
    config = setup,
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {

        -- Compatibility module for nvim-cmp sources
        {
            "Saghen/blink.compat",
            version = "*",
            lazy = true,
            opts = {},
        },

        -- Regular completion within a buffer
        { "hrsh7th/cmp-calc" },
        { "ribru17/blink-cmp-spell" },
        { "moyiz/blink-emoji.nvim" },

        -- AI autocompletion
        { "supermaven-inc/supermaven-nvim" },
        {
            "tzachar/cmp-tabnine",
            build = "./install.sh",
        },
    },
}
