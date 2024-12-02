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
        Boolean = "",
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
    diagnostics = {
        info = "",
        hint = "",
        warn = "",
        error = "",
    },
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
