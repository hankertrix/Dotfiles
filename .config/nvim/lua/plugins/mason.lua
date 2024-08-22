-- Configuration for Mason

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up Mason
local function setup()

    -- Stops executing if the package isn't installed
    if not utils.status_ok({ "mason", "mason-tool-installer" }) then return end

    -- Set up Mason
    require("mason").setup()

    -- Set up Mason tool installer
    require("mason-tool-installer").setup {

        -- Ensure that these packages are always installed
        ensure_installed = {

            -- LSP servers
            "lua_ls",                   -- Lua
            "pylsp",                    -- Python
            "tsserver",                 -- TypeScript and JavaScript
            "eslint",                   -- TypeScript and JavaScript ecosystem
            "rust_analyzer",            -- Rust
            "bashls",                   -- Bash and shell
            "clangd",                   -- C/C++
            "arduino_language_server",  -- Arduino
            "taplo",                    -- TOML
            "jsonls",                   -- JSON
            "ltex",                     -- English checker

            -- Formatters
            "stylua",           -- Lua formatter
            "prettierd",        -- JavaScript ecosystem formatter

            -- Linters
            "cspell"            -- English checker within code
        },
    }

end

-- Returns the Mason plugin for lazy.nvim
return {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = setup,
    lazy = true,
    cond = utils.firenvim_not_active,
    dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    cmd = {
        "Mason",
        "MasonInstall",
        "MasonUninstall",
        "MasonUninstallAll",
        "MasonLog",
        "MasonToolsInstall",
        "MasonToolsInstallSync",
        "MasonToolsUpdate",
        "MasonToolsUpdateSync",
        "MasonToolsClean"
    },
}
