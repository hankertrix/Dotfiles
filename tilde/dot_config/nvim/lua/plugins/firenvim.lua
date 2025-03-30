-- Configuration for Firenvim

-- The settings for Firenvim
local local_settings = {
	[".*"] = {

		-- Use Neovim's command line
		cmdline = "neovim",

		-- Never automatically use Firenvim
		takeover = "never",
	},

	-- GitHub settings
	["https?://github\\.com/(?!.*edit)"] = {

		-- Always takeover
		takeover = "always",

		-- Make the configuration of a higher priority
		priority = 1,
	},
}

-- Set up the Firenvim configuration
vim.g.firenvim_config = {
	localSettings = local_settings,
}

-- Returns the Firenvim plugin for lazy.nvim
return {
	"glacambre/firenvim",
	lazy = require("utils").firenvim_not_active(),
	module = false,
	build = ":call firenvim#install(0)",
	config = function(_, _)
		--

		-- Set the file type to mark down on GitHub
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = "github.com_*.txt",
			command = "set filetype=markdown",
		})
	end,
}
