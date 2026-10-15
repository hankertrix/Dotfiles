-- Configuration for tinymist
return {

	-- Set the root directory
	root_dir = function(bufnr, on_dir)

		-- Get the name of the current file
		local filename = vim.api.nvim_buf_get_name(bufnr)

		-- Get the root directory from the typst.toml file
		-- or from the currently opened file
		local root_directory = vim.fs.root(filename, "typst.toml")
			or vim.fs.dirname(filename)

		-- Return the root directory
		on_dir(root_directory)
	end,

	settings = {
		formatterMode = "typstyle",
		exportPdf = "onSave",
		formatterIndentSize = 4,
		formatterPrintWidth = require("shared_configs").max_line_length,
		formatterProseWrap = true,
		lint = {
			enabled = true,
			when = "onSave",
		},
		preview = {
			refresh = "onSave",
		},
	},
}
