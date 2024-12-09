-- Configuration for lualine

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up lualine
local function setup()
    --

    -- Gets the lualine module
    local lualine = require("lualine")

    -- Function to create a lualine extension for buffers
    -- that appear on the side
    local function create_side_ext(
        filetypes,
        buffer_name,
        hide_location,
        appear_at_the_right
    )
        --

        -- Get the function to get the buffer name
        local buffer_name_func = buffer_name
                and function() return buffer_name end
            or "filetype"

        -- Get the section for the display of the buffer name
        local buffer_name_section = {
            buffer_name_func,
            separator = {},
        }

        -- Create the side extension
        local side_ext = {
            sections = {
                lualine_b = appear_at_the_right and {}
                    or { buffer_name_section },

                lualine_x = hide_location and {} or { "location" },

                lualine_y = appear_at_the_right and { buffer_name_section }
                    or {},
            },

            filetypes = filetypes,
        }

        -- Return the side extension
        return side_ext
    end

    -- Function to create a lualine extension for buffers
    -- that appear above or below the current buffer
    local function create_full_width_ext(
        filetypes,
        buffer_name,
        git_branch_wanted
    )
        --

        -- The b section of the lualine
        local lualine_b_section = {
            buffer_name and function() return buffer_name end or "filetype",
        }

        -- If the git branch is wanted,
        -- add it to the lualine_b_section
        -- before the buffer name
        if git_branch_wanted then
            table.insert(lualine_b_section, 1, "branch")
        end

        -- Create the full width extension
        local full_width_ext = {
            sections = {

                lualine_a = {
                    {
                        "mode",
                        separator = { left = "" },
                    },
                },

                lualine_b = lualine_b_section,

                lualine_y = { "progress" },

                lualine_z = {
                    {
                        "location",
                        separator = { right = "" },
                    },
                },
            },

            filetypes = filetypes,
        }

        -- Return the full width extension
        return full_width_ext
    end

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

    -- Function to check if a file is UTF-8
    local function not_utf8()
        --

        -- Gets the file encoding
        local file_encoding = vim.opt.fenc:get()

        -- Returns false if the file isn't UTF-8
        return string.len(file_encoding) > 0
            and string.lower(file_encoding) ~= "utf-8"
    end

    -- Function to disable the winbar based on the file type
    local function should_disable_winbar()
        --

        -- Gets the file type of the current buffer
        local file_type = vim.bo.filetype

        -- Returns true if the file is not in the list of disabled file types
        -- and false otherwise
        return not vim.list_contains(
            require("shared_configs").disabled_file_types,
            file_type
        )
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
                cond = should_disable_winbar,
            },

            {
                "filename",
                file_status = false,
                cond = should_disable_winbar,
                separator = vim.trim(breadcrumb_separator),
            },

            {
                "aerial",
                sep = breadcrumb_separator,
                cond = should_disable_winbar,
            },
        },
    }

    -- If firenvim isn't active
    if utils.firenvim_not_active() then
        --

        -- Create the side extensions
        local aerial_ext = create_side_ext({ "aerial" }, " Aerial")
        local undotree_ext = create_side_ext({ "undotree" }, " Undo Tree")
        local diff_ext = create_side_ext({ "diff" }, " Diff")

        -- Create the full width extensions
        local trouble_ext = create_full_width_ext({ "trouble" }, "󱠪 Trouble")
        local neogit_ext =
            create_full_width_ext({ "NeogitStatus" }, "󰊢 Neogit", true)

        -- Get the diagnostic icons
        local diagnostic_icons = require("shared_configs").icons.diagnostics

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
                    {
                        "diagnostics",
                        symbols = {
                            info = diagnostic_icons.info .. " ",
                            hint = diagnostic_icons.hint .. " ",
                            warn = diagnostic_icons.warn .. " ",
                            error = diagnostic_icons.error .. " ",
                        },
                    },
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
                undotree_ext,
                diff_ext,
                aerial_ext,
                trouble_ext,
                neogit_ext,
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
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "aerial.nvim",
    },
}
