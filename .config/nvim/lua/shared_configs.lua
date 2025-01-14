-- Configurations that are shared between different plugins

-- Initialise the module
local M = {}

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
        Enum = "",
        EnumMember = "",
        Error = "",
        Event = "",
        Field = "󰜢",
        File = "󰈙",
        Folder = "󰉋",
        Function = "󰊕",
        Interface = "",
        Key = "󰌋",
        Keyword = "󱕵",
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
        Property = "󰖷",
        Reference = "",
        Snippet = "",
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

        -- Kind icons for completion sources

        -- Regular completion sources
        Command = "",
        Spell = "",
        Calculation = "",

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

    -- Git icons
    git = {
        modified = "", -- Modified "M"
        ft_changed = "", -- File type changed "T"
        added = "", -- Added "A"
        deleted = "", -- Deleted "D"
        renamed = "", -- Renamed "R"
        copied = "", -- Copied "C"
        unmerged = "", -- Unmerged "U"
        unknown = "", -- Unknown change type "X"
        untracked = "󱋽", -- Untracked
        ignored = "", -- Ignored
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
    "NeogitConsole",
    "NeogitDiffView",

    -- Neogit popup
    "NeogitPopup",
}

-- Set the max line length to 80
M.max_line_length = 80

-- Returns the module
return M
