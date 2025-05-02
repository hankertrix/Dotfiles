-- Configuration for quality of life related plugins
--
-- Currently the plugins used are:
--	- vim-sleuth for automatically detecting the indentation type
--	- markdown-preview.nvim to preview markdown files
--	- mini.trailspace to trim trailing whitespaces and blank lines
--	- quicker.nvim for an improved and editable quick fix list
--	- aerial.nvim to view an outline of the code
--	- snacks.nvim for general quality of life improvements

-- Get the icons from the shared configurations
local icons = require("shared_configs").icons()

-- Return the quality of life related plugins for lazy.nvim
return {

	-- Automatically detect the indentation type
	-- such as indentation using tabs vs spaces
	{ "tpope/vim-sleuth" },

	-- Better looking help files
	{ "OXY2DEV/helpview.nvim" },

	-- Markdown previewer
	{
		"OXY2DEV/markview.nvim",

		-- Plugin configuration
		opts = {

			-- Have the label for the code blocks appear on the left
			markdown = {
				code_blocks = {
					label_direction = "left",
				},
			},
		},

		-- Function to configure the plugin
		config = function(_, opts)
			--

			-- Function to patch the runtime path
			-- so that markview is sourced before anything else
			local function patch_runtime_path()
				--

				-- Initialise the markview path
				local markview_path = nil

				-- Get the runtime paths
				local runtime_paths = vim.opt.rtp:get()

				-- Iterate over the paths in the runtime paths
				for index, path in ipairs(runtime_paths) do
					--

					-- If the path is the markview path
					if path:match("markview%.nvim") then
						--

						-- Remove the path and save it to the variable
						markview_path = table.remove(runtime_paths, index)

						-- Break out of the loop
						break
					end
				end

				-- Insert markview path after ~/.config/nvim
				table.insert(runtime_paths, 2, markview_path)

				-- Set the runtime paths to the modified one
				vim.opt.rtp = runtime_paths
			end

			patch_runtime_path()

			-- Get the presets
			local presets = require("markview.presets")

			-- Configure the plugin
			require("markview").setup(vim.tbl_deep_extend("error", opts, {
				markdown = {
					headings = presets.headings.arrowed,
					tables = presets.tables.rounded,
				},
			}))
		end,
	},

	-- Trim trailing whitespace and blank lines
	{
		"echasnovski/mini.trailspace",
		version = false,
		lazy = true,
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },

		-- The function to configure the plugin
		config = function()
			--

			-- Get the plugin module
			local mini_trailspace = require("mini.trailspace")

			-- Set up the plugin
			mini_trailspace.setup()

			-- Create an auto command group to trim the whitespace on save
			local trim_whitespace_on_save_augroup = vim.api.nvim_create_augroup(
				"TrimWhitespaceOnSave",
				{ clear = true }
			)

			-- Create the auto command to trim the whitespace on save
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = trim_whitespace_on_save_augroup,
				desc = "Trim whitespace on save",
				callback = function()
					mini_trailspace.trim()
					mini_trailspace.trim_last_lines()
				end,
			})
		end,
	},

	-- Improved quick fix list for Neovim
	{
		"stevearc/quicker.nvim",
		ft = "qf",
		opts = {

			-- Key binds within the quick fix menu
			keys = {
				{
					">",
					function()
						require("quicker").expand({
							before = 2,
							after = 2,
							add_to_existing = true,
						})
					end,
					desc = "Expand quick fix context",
				},

				{
					"<",
					function() require("quicker").collapse() end,
					desc = "Collapse quick fix context",
				},
			},
		},
	},

	-- Snacks.nvim quality of life plugin
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bigfile = {
				enabled = true,

				-- Modify the big file configuration
				-- after it has been resolved
				config = function(opts, defaults)
					--

					-- Override the setup function,
					-- which is called when entering
					-- a big file
					opts.setup = function(ctx)
						--

						-- Call the default setup function
						defaults.setup(ctx)

						-- Disable Supermaven
						require("supermaven-nvim.api").stop()
					end
				end,
			},

			quickfile = { enabled = true },
			statuscolumn = { enabled = true },
			input = { enabled = true },
			image = { enabled = true, inline = false },
			picker = {
				enabled = true,

				-- Enable frecency
				matcher = {
					frecency = true,
				},

				-- Key binds in the window
				win = {
					input = {
						keys = {
							["<C-j>"] = {
								"preview_scroll_down",
								mode = { "n", "i" },
							},
							["<C-k>"] = {
								"preview_scroll_up",
								mode = { "n", "i" },
							},
						},
					},
				},

				-- Icons
				icons = {
					kinds = icons.kind,
					diagnostics = {
						Error = icons.diagnostics.error,
						Warn = icons.diagnostics.warn,
						Hint = icons.diagnostics.hint,
						Info = icons.diagnostics.info,
					},
					git = {
						enabled = true,
						commit = icons.git.commit .. " ",
						staged = icons.git.staged,
						added = icons.git.added,
						deleted = icons.git.deleted,
						ignored = icons.git.ignored,
						modified = icons.git.modified,
						renamed = icons.git.renamed,
						unmerged = icons.git.unmerged .. " ",
						untracked = icons.git.untracked,
					},
				},
			},
			indent = {
				enabled = true,
				scope = {
					hl = "Label",
				},
			},
		},

		-- Key binds
		keys = {

			-- Key bind to close the current buffer
			{
				"<Leader>x",
				function() Snacks.bufdelete() end,
				mode = "n",
				desc = "Close the current buffer",
			},

			-- Key binds involving the Snacks picker
			{
				"<F1>",
				function() Snacks.picker.help() end,
				mode = { "n", "x", "i" },
				desc = "Search through the help text",
			},
			{
				"<Leader>pf",
				function() Snacks.picker.files() end,
				mode = "n",
				desc = "Find files using the fuzzy finder",
			},
			{
				"<Leader>ps",
				function() Snacks.picker.grep() end,
				mode = "n",
				desc = "Search within files for a string",
			},
			{
				"<Leader>pb",
				function() Snacks.picker.buffers() end,
				mode = "n",
				desc = "Search through the open buffers",
			},
			{
				"<Leader>pr",
				function() Snacks.picker.registers() end,
				mode = "n",
				desc = "Search through Vim registers",
			},
			{
				"<Leader>pl",
				function() Snacks.picker.lines() end,
				mode = "n",
				desc = "Search through the lines in the current buffer",
			},
			{
				"<Leader>pi",
				function() Snacks.picker.pickers() end,
				mode = "n",
				desc = "Search through the list of pickers",
			},
			{
				"<Leader>te",
				function() Snacks.terminal.open() end,
				mode = "n",
				desc = "Open a terminal",
			},
			{
				"<Leader>/b",
				function() Snacks.picker.keymaps() end,
				mode = "n",
				desc = "Search through the list of key bindings",
			},
		},
	},
}
