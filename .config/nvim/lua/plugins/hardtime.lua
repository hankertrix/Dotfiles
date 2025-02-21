-- A list of plugins to make my life harder in Neovim
-- but build better habits and make editing
-- faster and more efficient.
--
-- Currently the plugins are:
--	- hardtime.nvim: Force me to use more efficient key binds
--	- precognition.nvim: Help with discovering possible Vim motions

-- Get the shared configurations
local shared_configs = require("shared_configs")

-- Return the plugins for lazy.nvim
return {

	-- Hardtime plugin to force me to build better habits
	-- using more efficient Vim motions
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },

		-- The function to configure the plugin
		config = function(_, opts)
			--

			-- Disable the show mode
			-- so I can see the hint messages
			vim.opt.showmode = false

			-- Set up the plugin
			require("hardtime").setup(opts)
		end,

		-- The options for the plugin
		opts = {

			-- Disabled the plugin for the following filetypes
			disabled_filetypes = shared_configs.disabled_file_types,

			-- Additional hints
			hints = {

				-- Hint to use b instead of ()
				["[dcyvV][ia][%(%)]"] = {
					message = function(keys)
						return "Use "
							.. keys:sub(1, 2)
							.. "b instead of "
							.. keys
					end,
					length = 3,
				},

				-- Hint to use B instead of {}
				["[dcyvV][ia][%{%}]"] = {
					message = function(keys)
						return "Use "
							.. keys:sub(1, 2)
							.. "B instead of "
							.. keys
					end,
					length = 3,
				},
			},
		},
	},

	-- Precognition plugin to help me discover
	-- Vim motions to move to a point
	{
		"tris203/precognition.nvim",
		event = "VeryLazy",
		opts = {
			disabled_fts = shared_configs.disabled_filetypes,
		},
	},
}
