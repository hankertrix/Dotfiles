-- Configuration for Mason

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up Mason
local function setup()
	--

	-- Set up Mason
	require("mason").setup()

	-- Set up Mason tool installer
	require("mason-tool-installer").setup({

		-- Ensure that these packages are always installed
		ensure_installed = {

			-- LSP servers
			"lua_ls",           -- Lua
			"vtsls",            -- TypeScript and JavaScript
			"astro",            -- Astro
			"rust_analyzer",    -- Rust
			"bashls",           -- Bash (shell)
			"mdx_analyzer",     -- MDX
			"marksman",         -- Markdown
			"tinymist",         -- Typst
			"texlab",           -- LaTeX and BibTeX
			"marksman",         -- Markdown
			"jsonls",           -- JSON
			"taplo",            -- TOML
			"yamlls",           -- YAML
			-- "harper_ls",		-- English checker

			-- Formatters
			"stylua",           -- Lua
			"prettierd",        -- TypeScript and JavaScript ecosystem
			"shfmt",            -- Shell

			-- Linters
			"eslint_d",         -- TypeScript and JavaScript ecosystem
			"shellcheck",       -- Shell
			"markdownlint",     -- Markdown
			"gitlint",          -- Git commit message
			"cspell",           -- English checker within code
		},
	})
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
		"MasonToolsClean",
	},
}
