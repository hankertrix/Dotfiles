-- Configuration for lualine

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up lualine
local function setup()
    --

    -- Stops executing if the theme isn't installed
    if not utils.status_ok("lualine") then return end

    -- Gets the lualine module
    local lualine = require("lualine")

    ------------------------- Quickfix List Extension -------------------------

    -- Checks if the quickfix list is a location list
    local function is_loclist()
        return vim.fn.getloclist(0, { filewinid = 1 }).filewinid ~= 0
    end

    -- The label for the quickfix extension
    local function label()
        return is_loclist() and "Location List" or "Quickfix List"
    end

    -- The title of the quickfix or location list
    local function title()
        if is_loclist() then
            return vim.fn.getloclist(0, { title = 0 }).title
        end
        return vim.fn.getqflist({ title = 0 }).title
    end

    -- The quickfix extension for lualine
    local quickfix_ext = {

        init = function()
            --

            -- Make sure the quick fix window
            -- doesn't create a custom status line
            vim.g.qf_disable_statusline = true
        end,

        sections = {
            lualine_a = {
                { label, separator = {} },
            },

            lualine_b = {
                { title, separator = {} },
            },

            lualine_z = {
                { "location", separator = {} },
            },
        },

        filetypes = { "qf" },
    }

    ---------------------------------------------------------------------------

    ------------------------- Git Fugitive Extension --------------------------

    -- Function to get the fugitive branch name
    local function fugitive_branch()
        local icon = ""
        return icon .. " " .. vim.fn.FugitiveHead()
    end

    -- The fugitive extension for lualine
    local fugitive_ext = {
        sections = {
            lualine_a = {
                {
                    fugitive_branch,
                    separator = { left = "", right = "" },
                },
            },
            lualine_z = {
                { "location", separator = { left = "", right = "" } },
            },
        },

        filetypes = { "fugitive" },
    }

    ---------------------------------------------------------------------------

    ---------------------------- Undotree Extension ---------------------------

    -- A general lualine extension for most other buffers
    local undotree_ext = {
        sections = {
            lualine_b = {
                {
                    function()
                        return " undotree"
                    end,
                    separator = {},
                },
            },

            lualine_x = { "location" },
        },

        filetypes = { "undotree" },
    }

    ---------------------------------------------------------------------------

    ---------------------------- Aerial Extension -----------------------------

    -- A lualine extension for aerial
    local aerial_ext = {
        sections = {
            lualine_y = {
                {
                    function()
                        return " aerial"
                    end,
                    separator = {},
                },
            },
        },

        filetypes = { "aerial" },
    }

    ---------------------------------------------------------------------------

    ---------------------------- General Extension ----------------------------

    -- A general lualine extension for most other buffers
    local general_ext = {
        sections = {
            lualine_b = {
                { "filetype", separator = {} },
            },

            lualine_x = { "location" },
        },

        filetypes = { "diff" },
    }

    ---------------------------------------------------------------------------

    -- Function to check if a file is UTF-8
    local function not_utf8()
        --

        -- Gets the file encoding
        local file_encoding = vim.opt.fenc:get()

        -- Returns false if the file isn't UTF-8
        return string.len(file_encoding) > 0
            and string.lower(file_encoding) ~= "utf-8"
    end

    -- Function to disable the winbar based on the file type type
    local function is_not_plugin_buffer()
        --

        -- Gets the file type of the current buffer
        local file_type = vim.bo.filetype

        -- Returns true if the file is not in the list of plugin file types
        -- and false otherwise
        return not utils.has_value(utils.plugin_file_types, file_type)
    end

    -- The breadcrumb separator for the winbar
    -- A breadcrumb displays the current location within a hierarchy
    local breadcrumb_separator = " ⟩ "

    -- The winbar for lualine
    local winbar = {
        lualine_c = {

            {
                "filetype",
                icon_only = true,
                separator = {},
                cond = is_not_plugin_buffer,
            },

            {
                "filename",
                file_status = false,
                cond = is_not_plugin_buffer,
                separator = vim.trim(breadcrumb_separator),
            },

            {
                "aerial",
                sep = breadcrumb_separator,
                cond = is_not_plugin_buffer,
            },
        },
    }

    -- If firenvim isn't active
    if utils.firenvim_not_active() then
        --

        -- Sets up lualine to look like bubbles in the lualine GitHub
        lualine.setup({

            options = {
                theme = "auto",
                component_separators = "|",
                section_separators = { left = "", right = "" },
            },

            sections = {
                lualine_a = {
                    {
                        "mode",
                        separator = { left = "" },
                    },
                },

                lualine_b = {
                    "branch",
                    "diff",
                    "diagnostics",
                    "filename",
                },

                lualine_c = { "fileformat" },

                -- Only displays the file encoding when the file isn't UTF-8
                lualine_x = { { "encoding", cond = not_utf8 } },
                lualine_y = { "filetype", "progress" },

                lualine_z = {
                    {
                        "location",
                        separator = { right = "" },
                    },
                },
            },

            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },

            -- Winbar with aerial
            winbar = winbar,
            inactive_winbar = winbar,

            extensions = {
                quickfix_ext,
                fugitive_ext,
                undotree_ext,
                aerial_ext,
                general_ext,
            },
        })

    -- Otherwise
    else
        --

        -- Sets up lualine to show no icons, no special characters
        -- and have no filename
        -- (the file name on the website looks really bad)
        lualine.setup({

            options = {
                icons_enabled = false,
                section_separators = "",
                component_separators = { left = "", right = "|" },
            },

            -- Remove the filename section
            sections = {
                lualine_c = {},
            },

            -- The extensions to load
            extensions = { quickfix_ext },
        })
    end
end

-- Returns the lualine plugin for lazy.nvim
return {
    "nvim-lualine/lualine.nvim",
    config = setup,
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
