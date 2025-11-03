-- Treesitter config

-- Returns the treesitter plugins for lazy.nvim
return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function(_, opts)
			--

			-- Get the treesitter plugin
			local treesitter = require("nvim-treesitter.configs")

			-- Set up treesitter
			treesitter.setup(opts)
		end,

		-- Events to lazy load on
		event = {
			"VeryLazy",
			"BufReadPost",
			"BufNewFile",
			"BufWritePre",
		},

		-- Commands to lazy load on
		cmd = {
			"TSInstall",
			"TSInstallFromGrammar",
			"TSInstallInfo",
			"TSInstallSync",
			"TSUninstall",
			"TSUpdate",
			"TSUpdateSync",
			"TSBufDisable",
			"TSBufEnable",
			"TSBufToggle",
			"TSConfigInfo",
			"TSDisable",
			"TSEditQuery",
			"TSEditQueryUserAfter",
			"TSEnable",
			"TSModuleInfo",
			"TSToggle",
		},

		-- Set up the plugin
		opts = {

			-- A list of parser names
			ensure_installed = {
				"python",
				"html",
				"javascript",
				"typescript",
				"rust",
				"cpp",
				"bash",
				"json",
				"toml",
				"yaml",
				"svelte",

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

	-- Context at the top of the screen
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter" },

		-- Events to lazy load on
		event = {
			"VeryLazy",
			"BufReadPost",
			"BufNewFile",
			"BufWritePre",
		},

		-- Commands to lazy load on
		cmd = {
			"TSContextDisable",
			"TSContextEnable",
			"TSContextToggle",
		},

		-- Set the maximum number of lines to 5
		opts = {
			max_lines = 5,
		},
	},

	-- Syntax highlighting for MDX
	{
		"davidmh/mdx.nvim",
		config = true,
		dependencies = { "nvim-treesitter" },
	},
}
