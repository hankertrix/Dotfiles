-- Auto pair configuration
-- Currently, it's nvim-autopairs

-- Returns the auto pairs plugin for lazy.nvim
return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = {
		disable_filetype = {
			"TelescopePrompt",
			"spectre_panel",
			"Tybr",
			"typr",
		},
	},
}
