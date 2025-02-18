-- Treesitter config

-- Gets the module with the utilities
local utils = require("utils")

-- Returns the treesitter plugins for lazy.nvim
return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function(_, opts)
			local treesitter = require("nvim-treesitter.configs")
			treesitter.setup(opts)
		end,
		event = { "VeryLazy", "BufReadPost", "BufNewFile", "BufWritePre" },
		cmd = {
			"TSInstall",
			"TSUninstall",
			"TSUpdate",
			"TSUpdateSync",
			"TSInstallInfo",
			"TSInstallSync",
			"TSInstallFromGrammar",
		},

		opts = {

			-- A list of parser names
			ensure_installed = {
				"python",
				"html",
				"javascript",
				"typescript",
				"rust",
				"cpp",
				"gdscript",
				"bash",
				"json",
				"toml",
				"yaml",

				-- Git commits
				"gitcommit",

				-- Regex
				"regex",

				-- These parsers should always be installed
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
			},

			-- Don't install parsers synchronously
			-- (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have
			-- `tree-sitter` CLI installed locally
			auto_install = true,

			highlight = {

				-- `false` will disable the whole extension
				enable = true,

				-- Setting this to true will run `:h syntax`
				-- and tree-sitter at the same time.
				--
				-- Set this to `true` if you depend on 'syntax'
				-- being enabled (like for indentation).
				--
				-- Using this option may slow down your editor,
				-- and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "VeryLazy", "BufReadPost", "BufNewFile", "BufWritePre" },
		cmd = {
			"TSContextEnable",
			"TSContextDisable",
			"TSContextToggle",
		},
	},
}
