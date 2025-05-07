-- Configuration for Lua LS
return {

	-- Function to call on initialisation of Lua LS
	on_init = function(client)
		--

		-- If there are workspace folders
		if client.workspace_folders then
			--

			-- Get the path
			local path = client.workspace_folders[1].name

			-- If there is a project local configuration, don't do anything
			if
				vim.uv.fs_stat(vim.fs.joinpath(path, ".luarc.json"))
				or vim.uv.fs_stat(vim.fs.joinpath(path, ".luarc.jsonc"))
			then
				return
			end
		end

		-- Configure Lua LS for Neovim
		client.config.settings.Lua =
			vim.tbl_deep_extend("force", client.config.settings.Lua, {
				--

				-- Configure the Lua runtime used
				runtime = {

					-- Tell Lua LS what version of Lua is being used
					version = "LuaJIT",

					-- Tell Lua LS how to find Lua modules
					-- the same way as Neovim
					path = {
						"lua/?.lua",
						"lua/?/init.lua",
					},
				},

				-- Make the server aware of Neovim runtime files
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME,
						vim.fn.stdpath("config"),
					},
				},
			})
	end,

	-- Disable formatting as stylua covers that
	init_options = {
		documentFormatting = false,
		documentRangeFormatting = false,
	},

	settings = {
		Lua = {

			-- Disable formatting as stylua covers that
			format = {
				enable = false,
			},

			-- Enable inlay hints
			hint = {
				enable = true,
				setType = true,
			},
		},
	},
}
