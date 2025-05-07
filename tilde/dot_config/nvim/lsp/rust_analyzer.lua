-- Configuration for rust analyzer
return {

	-- Enable inlay hints
	on_attach = function(_, buffer_number)
		vim.lsp.inlay_hint.enable(true, { bufnr = buffer_number })
	end,

	settings = {
		["rust-analyzer"] = {

			-- Use clippy instead of cargo check
			check = {
				command = "clippy",
				features = "all",
			},
		},
	},
}
