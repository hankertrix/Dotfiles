-- Configurations that are shared between different plugins

-- Initialise the module
local M = {}


-- The default completion sources for nvim cmp
M.default_cmp_sources = {
    {
        name = "spell",
        option = {
            keep_all_entries = false,
            enable_in_context = function()
                return true
            end
        }
    },
    { name = "buffer" },
    { name = "calc" },
    { name = "emoji" }
}


-- Function to return the LSP diagnostic icons I use
function M.lsp_diagnostic_icons(warning_text)

    -- Sets the warning text to "warn" if it isn't given
    warning_text = warning_text or "warn"

    -- The LSP icons that I want
    local lsp_icons = {
        error = "󰅚",
        hint = "󰌶",
        info = "󰋽",
    }

    -- Sets the warning text to the warning symbol
    lsp_icons[warning_text] = "󰀪"

    -- Returns the LSP icons
    return lsp_icons

end


-- The list of short names for the sources
M.source_names = {
    buffer = "Buffer",
    nvim_lsp = "LSP",
    luasnip = "LuaSnip",
    nvim_lua = "Lua",
    latex_symbols = "LaTeX",
    cmp_tabnine = "Tabnine",
    nvim_lsp_signature_help = "LSP Signature Help",
    cmdline_history = "Cmdline History"
}


-- The list of LSP kind icons that I want to use
M.lsp_kind_icons = {

    Array = "󰅪",
    Boolean = "◩",
    Class = "󰠱",
    Color = "󰏘",
    Constant = "󰏿",
    Constructor = "",
    Enum = "",
    EnumMember = "",
    Error = "",
    Event = "",
    Field = "",
    File = "󰈙",
    Folder = "󰉋",
    Function = "󰊕",
    Interface = "",
    Key = "󰌋",
    Keyword = "󰌋",
    Macro = "",
    Method = "󰆧",
    Module = "",
    Namespace = "󰌗",
    Null = "󰟢",
    Number = "󰎠",
    Object = "󰅩",
    Operator = "",
    Package = "󰏖",
    Parameter = "",
    Property = "",
    Reference = "",
    Snippet = "",
    StaticMethod = "󰠄",
    String = "",
    Struct = "",
    TabNine = "󰚩",
    Text = "󰉿",
    TypeAlias = "",
    TypeParameter = "",
    Unit = "",
    Value = "",
    Variable = "󰫧",
    Collapsed = "",

}



-- Returns the module
return M
