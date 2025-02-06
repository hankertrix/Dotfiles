-- Configuration for gdscript files

-- Get the port to connect to the Godot LSP
local port = tonumber(os.getenv("GDScript_Port") or "6005")

-- The command to connect to the Godot LSP
local command = vim.lsp.rpc.connect("127.0.0.1", port)

-- The pipe to communicate with the Godot LSP
local pipe = "/tmp/godot.pipe"

-- Set the theme to the dark theme
vim.cmd("colorscheme " .. require("shared_configs").dark_theme)

-- Start the lsp
vim.lsp.start({
	name = "Godot",
	cmd = command,
	root_dir = vim.fs.dirname(
		unpack(vim.fs.find({ "project.godot", ".git" }, { upward = true }))
	),
	on_attach = function(_, _)
		local server_list = vim.fn.serverlist()
		if not vim.tbl_contains(server_list, pipe) then
			vim.api.nvim_command(string.format('echo serverstart("%s")', pipe))
		end
	end,
})
