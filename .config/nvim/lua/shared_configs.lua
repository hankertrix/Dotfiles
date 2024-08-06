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
            end
        }
    },
    { name = "buffer" },
    { name = "calc" },
    { name = "emoji" }
}


-- The function to return the default mappings for nvim-cmp
function M.default_cmp_mappings()

    -- Tries loading nvim-cmp
    local status_ok, cmp = pcall(require, "cmp")

    -- If nvim-cmp isn't loaded, exit the function and return an empty table
    if not status_ok then return {} end

    -- The selection options for nvim-cmp
    local select_opts = { behavior = cmp.SelectBehavior.Select }

    -- The default mappings for nvim-cmp
    local default_cmp_mappings = {

        -- Use vim's default scrolling to scroll the documentation in the cmp menu
        ['<C-d>'] = cmp.mapping.scroll_docs(5),
        ['<C-u>'] = cmp.mapping.scroll_docs(-5),
        ["<C-f>"] = cmp.mapping.scroll_docs(5),
        ["<C-b>"] = cmp.mapping.scroll_docs(-5),


        -- Use up and down arrow keys to select the previous and next item respectively
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),


        -- Ctrl + p  and Ctrl + n work similarly to the up and down arrow keys
        -- but will turn on cmp if the cmp menu is not visible
        ['<C-p>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item(select_opts)
            else
                cmp.complete()
            end
        end),

        ['<C-n>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_next_item(select_opts)
            else
                cmp.complete()
            end
        end),


        -- Use tab or Ctrl + y to complete
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        ['<C-y>'] = cmp.mapping.confirm({ select = false }),

        -- Use Ctrl + e to exit the cmp menu
        ['<C-e>'] = cmp.mapping.abort(),

        -- Vim's default mapping for completions
        ["<C-Space>"] = cmp.mapping.complete(),
    }

    -- Returns the default cmp mappings
    return default_cmp_mappings

end



-- Function to return the LSP diagnostic icons I use
function M.lsp_diagnostic_icons(warning_text)

    -- Sets the warning text to "warn" if it isn't given
    warning_text = warning_text or "warn"

    -- The LSP icons that I want
    local lsp_icons = {
        error = "",
        hint = "",
        info = "",
    }

    -- Sets the warning text to the warning symbol
    lsp_icons[warning_text] = ""

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
    Codeium = "󰘦",
    Supermaven = "",

}


-- Set the max line length to 80
M.max_line_length = 80


-- Returns the module
return M
