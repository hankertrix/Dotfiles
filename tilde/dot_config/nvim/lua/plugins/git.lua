-- Git plugin configuration
-- Currently it's Neogit

-- Gets the module with the utilities
local utils = require("utils")

-- Returns the git plugin for lazy.nvim
return {
	"NeogitOrg/neogit",
	dependencies = "nvim-lua/plenary.nvim",
	lazy = true,
	cond = utils.firenvim_not_active,
	cmd = "Neogit",
	opts = {

		-- Disable the process spinner
		-- to stop the cursor from flickering
		-- in pretty much all terminals.
		--
		-- Only Kitty manages to not flicker
		-- the cursor when the process spinner
		-- is active.
		--
		-- Not sure how it manages to do so,
		-- but it's pretty impressive.
		process_spinner = false,

		-- Fold the untracked files
		-- by default, following Magit's
		-- default behaviour
		sections = {
			untracked = {
				folded = true,
			},
		},

		-- Use Magit's default mappings
		mappings = {
			popup = {
				["F"] = "PullPopup",
				["p"] = "PushPopup",
				["P"] = "PushPopup",
				["_"] = "RevertPopup",
				["v"] = false,
				["O"] = "ResetPopup",
				["X"] = false,
				["%"] = "WorktreePopup",
				["w"] = false,
			},
			status = {
				["X"] = "Untrack",
				["K"] = "Untrack",
			},
		},
	},

	keys = {

		-- The key bind to open Neogit
		{
			"<Leader>gs",
			function() require("neogit").open() end,
			mode = "n",
			desc = "Open Git",
		},
	},
}
