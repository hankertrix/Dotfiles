-- Configuration for plugins that are game-like.
--
-- These plugins aren't necessary, they are just fun to have.

-- Return the game-like plugins for lazy.nvim
return {

	-- Vim Be Good game to practice Vim motions
	{
		"ThePrimeagen/vim-be-good",
		lazy = true,
		cmd = "VimBeGood",
	},

	-- Nvim training plugin to practice Vim motions
	{
		"Weyaaron/nvim-training",
		lazy = true,
		cmd = "Training",
		opts = {},
	},

	-- Typr plugin to practice typing
	{
		"nvzone/typr",
		lazy = true,
		dependencies = "nvzone/volt",
		cmd = { "Typr", "TyprStats" },
		opts = {},
	},
}
