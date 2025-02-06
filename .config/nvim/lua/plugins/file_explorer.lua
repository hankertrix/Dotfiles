-- The configuration for the file explorer
-- Currently, the plugin used is yazi.nvim

-- Gets the module with the utilities
local utils = require("utils")

-- Returns the file explorer plugin for lazy.nvim
return {
	"mikavilpas/yazi.nvim",
	cond = utils.firenvim_not_active,
	event = "VeryLazy",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = { open_for_directories = true },
	keys = {
		{
			"<Leader>pw",
			function() require("yazi").yazi() end,
			mode = "n",
			desc = "Opens the directory of the current file",
		},
		{
			"<Leader>ec",
			function() require("yazi").yazi(nil, "~/.config/nvim/lua/") end,
			mode = "n",
			desc = "Opens the Neovim config directory",
		},
	},
}
