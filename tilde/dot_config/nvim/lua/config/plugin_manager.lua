-- Plugin manager configuration

-- Bootstrap lazy.nvim
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazy_path) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazy_path,
	})
end
vim.opt.rtp:prepend(lazy_path)

-- Plugin manager setup
return require("lazy").setup({
	spec = {

		-- Import the plugins directory
		{ import = "plugins" },
	},

	-- Set the lockfile location
	-- to be in the dotfiles directory
	lockfile = "~/.dotfiles/tilde/dot_config/nvim/lazy-lock.json",
})
