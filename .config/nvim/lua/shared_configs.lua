-- Configurations that are shared between different plugins

-- Initialise the module
local M = {}

-- The default completion sources for nvim-cmp
M.default_cmp_sources = {
    {
        name = "spell",
        option = {
            keep_all_entries = false,
            enable_in_context = function()
                return true
            end,
        },
    },
    { name = "buffer" },
    { name = "calc" },
    { name = "emoji" },
}

-- The function to return the default mappings for nvim-cmp
---@return table default_cmp_mappings The default mappings for nvim-cmp
function M.default_cmp_mappings()
    --

    -- Tries loading nvim-cmp
    local status_ok, cmp = pcall(require, "cmp")

    -- If nvim-cmp isn't loaded, exit the function and return an empty table
    if not status_ok then return {} end

    -- The selection options for nvim-cmp
    local select_opts = { behavior = cmp.SelectBehavior.Select }

    -- The default mappings for nvim-cmp
    local default_cmp_mappings = {

        -- Use vim's default scrolling to scroll
        -- the documentation in the cmp menu
        ["<C-d>"] = cmp.mapping.scroll_docs(5),
        ["<C-u>"] = cmp.mapping.scroll_docs(-5),
        ["<C-f>"] = cmp.mapping.scroll_docs(5),
        ["<C-b>"] = cmp.mapping.scroll_docs(-5),

        -- Use up and down arrow keys to select the previous
        -- and next item respectively
        ["<Up>"] = cmp.mapping.select_prev_item(select_opts),
        ["<Down>"] = cmp.mapping.select_next_item(select_opts),

        -- Ctrl + p and Ctrl + n work similarly to the up and down arrow keys
        -- but will turn on cmp if the cmp menu is not visible
        ["<C-p>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item(select_opts)
            else
                cmp.complete()
            end
        end),

        ["<C-n>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_next_item(select_opts)
            else
                cmp.complete()
            end
        end),

        -- Use tab or Ctrl + y to complete
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        ["<C-y>"] = cmp.mapping.confirm({ select = false }),

        -- Use Ctrl + e to exit the cmp menu
        ["<C-e>"] = cmp.mapping.abort(),

        -- Vim's default mapping for completions
        ["<C-Space>"] = cmp.mapping.complete(),
    }

    -- Returns the default cmp mappings
    return default_cmp_mappings
end

-- The list of short names for the sources
M.source_names = {
    buffer = "Buffer",
    nvim_lsp = "LSP",
    luasnip = "LuaSnip",
    nvim_lua = "Lua",
    latex_symbols = "LaTeX",
    cmp_tabnine = "TabNine",
    nvim_lsp_signature_help = "LSP Signature Help",
    cmdline_history = "Command Line History",
}

-- The list of icons that I want to use
M.icons = {
    lsp_kind = {
        Array = "󰅪",
        Boolean = "◩",
        Class = "󰠱",
        Color = "󰏘",
        Constant = "󰏿",
        Constructor = "",
        Control = "",
        Enum = "",
        EnumMember = "",
        Error = "",
        Event = "",
        Field = "",
        File = "󰈙",
        Folder = "󰉋",
        Function = "󰊕",
        Interface = "",
        Key = "󰌋",
        Keyword = "",
        Macro = "",
        Method = "",
        Module = "",
        Namespace = "󰌗",
        Null = "󰟢",
        Number = "",
        Object = "󰅩",
        Operator = "",
        Package = "󰏖",
        Parameter = "󰗴",
        Property = "󰜢",
        Reference = "",
        Snippet = "",
        StaticMethod = "󱇯",
        String = "",
        Struct = "󰆼",
        Text = "",
        TypeAlias = "󱄀",
        TypeParameter = "",
        Unit = "",
        Value = "󰎠",
        Variable = "󰫧",
        Collapsed = "",

        -- AI code completion
        TabNine = "󰏚",
        Supermaven = "",
        Codeium = "󰘦",
        Copilot = "",
    },

    -- Diagnostic icons
    --
    -- The function takes an optional number of spaces to append and
    -- an optional mapping to the diagnostic severity
    -- and returns the table of diagnostic icons.
    --
    -- An example of the diagnostic severity mapping is:
    -- {
    --     info = vim.diagnostic.severity.INFO,
    --     hint = vim.diagnostic.severity.HINT,
    --     warn = vim.diagnostic.severity.WARN,
    --     error = vim.diagnostic.severity.ERROR,
    -- }
    --
    ---@param spaces_to_append number|nil The number of spaces to append
    ---@param diagnostic_severity_mapping table|nil Diagnostic severity map
    ---@return table diagnostic_icons The table of diagnostic icons
    diagnostics = function(spaces_to_append, diagnostic_severity_mapping)
        --

        -- Initialise the diagnostic icons
        local diagnostic_icons = {
            info = "",
            hint = "",
            warn = "",
            error = "",
        }

        -- If the diagnostic severity mapping is not given
        -- and the number of spaces is not given,
        -- then return the diagnostic icons
        if not diagnostic_severity_mapping and not spaces_to_append then
            return diagnostic_icons
        end

        -- If the spaces to append is not given
        -- then set it to 0
        spaces_to_append = spaces_to_append or 0

        -- If the diagnostic severity mapping is not given
        -- then set it to an empty table
        diagnostic_severity_mapping = diagnostic_severity_mapping or {}

        -- Create the format string
        local format_string = string.format("%%-%ds", spaces_to_append)

        -- Create the string of spaces to append
        local string_of_spaces = string.format(format_string, " ")

        -- Initialise the mapped diagnostic icons
        local mapped_diagnostic_icons = {}

        -- Otherwise, iterate over the diagnostic icons
        for diagnostic_severity, icon in pairs(diagnostic_icons) do
            --

            -- Get the key for the mapped diagnostic icons
            local key = diagnostic_severity_mapping[diagnostic_severity]
                or diagnostic_severity

            -- Append the spaces to the diagnostic icon and set it to the table
            mapped_diagnostic_icons[key] = icon .. string_of_spaces
        end

        -- Return the mapped diagnostic icons
        return mapped_diagnostic_icons
    end,
}

-- The list of disabled file types
M.disabled_file_types = {
    "help",
    "checkhealth",
    "netrw",
    "qf",
    "gitcommit",
    "gitrebase",

    -- Plugin specific filetypes
    "packer",
    "dirvish",
    "dirbuf",
    "diff",
    "mason",
    "lazy",
    "lspinfo",
    "null-ls-info",
    "fugitive",
    "undotree",
    "aerial",
    "harpoon",
    "minifiles",
    "trouble",
    "Trouble",
    "NvimTree",
    "TelescopePrompt",
    "WhichKey",

    -- Neogit buffers
    "NeogitGitCommandHistory",
    "NeogitStatus",
    "NeogitLogView",
    "NeogitReflogView",
    "NeogitCommitView",
    "NeogitCommitSelectView",
    "NeogitRefsView",

    -- Neogit popups
    "NeogitBisectPopup",
    "NeogitBranchConfigPopup",
    "NeogitBranchPopup",
    "NeogitCherryPickPopup",
    "NeogitCommitPopup",
    "NeogitDiffPopup",
    "NeogitFetchPopup",
    "NeogitHelpPopup",
    "NeogitIgnorePopup",
    "NeogitLogPopup",
    "NeogitMergePopup",
    "NeogitPullPopup",
    "NeogitPushPopup",
    "NeogitRebasePopup",
    "NeogitRemotePopup",
    "NeogitResetPopup",
    "NeogitRevertPopup",
    "NeogitStashPopup",
    "NeogitTagPopup",
    "NeogitWorktreePopup",
}

-- Set the max line length to 80
M.max_line_length = 80

-- Returns the module
return M
