-- Treesitter config

-- Returns the treesitter plugins for lazy.nvim
return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",

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
			"TSUninstall",
			"TSUpdate",
			"TSContext",
			"TSLog",
		},

		-- Set up the plugin
		opts = {

			-- A list of parser names
			ensure_installed = {

				-- JavaScript ecosystem
				"html",
				"css",
				"javascript",
				"typescript",
				"svelte",
				"astro",

				-- Programming languages
				"python",
				"rust",
				"cpp",
				"bash",
				"typst",

				-- Configuration languages
				"json",
				"toml",
				"yaml",
				"kdl",
				"ron",

				-- Miscellaneous
				"xml",
				"vhs",
				"rasi",
				"regex",
				"bibtex",

				-- Git
				"gitcommit",
				"gitignore",
				"git_config",
				"git_rebase",

				-- These parsers should always be installed
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
			},
		},

		config = function(_, opts)

			-- Get the treesitter plugin
			local treesitter = require("nvim-treesitter")

			-- Set up treesitter
			treesitter.setup(opts)

			-- Create the auto command to start treesitter
			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup(
					"Treesitter",
					{ clear = true }
				),
				callback = function()

					-- Enable treesitter highlighting and disable regex syntax
					pcall(vim.treesitter.start)

					-- Enable treesitter-based indentation
					vim.bo.indentexpr =
						"v:lua.require('nvim-treesitter').identexpr()"
				end,
			})

			-- Get the already installed parsers
			local installed_parsers =
				require("nvim-treesitter.config").get_installed()

			-- Get the parsers to install
			local parsers_to_install = vim.iter(opts.ensure_installed)
				:filter(
					function(parser)
						return not vim.tbl_contains(installed_parsers, parser)
					end
				)
				:totable()

			-- Install the missing parsers
			treesitter.install(parsers_to_install)
		end,
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
		dependencies = { "nvim-treesitter" },
	},
}
