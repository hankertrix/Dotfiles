-- The configuration for the smart column plugin
-- Currently it's nerd_column.nvim

-- Gets the module with the shared configurations
local shared_configs = require("shared_configs")

-- Returns the smart column plugin for lazy.nvim
return {
	"hankertrix/nerd_column.nvim",
	dev = true,
	dir = "~/projects/nerd_column.nvim",
	event = { "BufReadPost", "BufNewFile", "BufWritePre" },
	opts = {

		-- Show a line on the right that represents the maximum column width.
		-- This makes it easier to keep to a character limit, usually 80.
		colour_column = shared_configs.max_line_length,

		-- Disable the plugins for the file types below
		disabled_file_types = vim.list_extend(
			{ "text" },
			shared_configs.disabled_file_types
		),
	},
}
