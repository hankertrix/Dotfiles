-- LSP configuration

-- Gets the module with the utilities
local utils = require("utils")

-- The table of descriptions
local descriptions = {
	definition = "Go to definition",
	declaration = "Go to declaration",
	signature_help = "Show signature information",
	format = "Formats the buffer using the LSP",
	diagnostic_window = "Show diagnostics in a floating window",
}

-- The list of externally installed LSPs
local externally_installed_lsps = {
	"efm",
	"ltex_plus",
	"ty",
}

-- Function to set up the lsp
local function setup()
	--

	-- Create the LSP keybinds
	vim.api.nvim_create_autocmd("LspAttach", {
		desc = "LSP actions",
		callback = function(event)
			--

			-- The options for the key mappings
			local opts = { buffer = event.buf }

			-- Key bind to go to definition
			vim.keymap.set(
				"n",
				"grd",
				vim.lsp.buf.definition,
				vim.tbl_extend(
					"error",
					opts,
					{ desc = descriptions.definition }
				)
			)

			-- Key bind to go to declaration
			vim.keymap.set(
				"n",
				"grD",
				vim.lsp.buf.declaration,
				vim.tbl_extend(
					"error",
					opts,
					{ desc = descriptions.declaration }
				)
			)

			-- Key bind to show signature help
			vim.keymap.set(
				"n",
				"grs",
				vim.lsp.buf.signature_help,
				vim.tbl_extend(
					"error",
					opts,
					{ desc = descriptions.signature_help }
				)
			)

			-- Key bind to format the buffer
			vim.keymap.set(
				{ "n", "x" },
				"<Leader>f",
				function() vim.lsp.buf.format({ async = true }) end,
				vim.tbl_extend("error", opts, { desc = descriptions.format })
			)

			-- Key bind to show diagnostics
			vim.keymap.set(
				"n",
				"grl",
				vim.diagnostic.open_float,
				vim.tbl_extend(
					"error",
					opts,
					{ desc = descriptions.diagnostic_window }
				)
			)
		end,
	})

	-- Iterate over the externally installed LSPs and enable them
	for _, lsp_name in ipairs(externally_installed_lsps) do
		vim.lsp.enable(lsp_name)
	end

	-- Set up mason-lspconfig
	require("mason-lspconfig").setup()

	-- Get the shared configs file
	local shared_configs = require("shared_configs")

	-- Get the diagnostic icons
	local diagnostic_icons = shared_configs.icons().diagnostics

	-- Configure the diagnostics
	vim.diagnostic.config({
		virtual_text = true,
		signs = {
			text = {
				[vim.diagnostic.severity.INFO] = diagnostic_icons.info,
				[vim.diagnostic.severity.HINT] = diagnostic_icons.hint,
				[vim.diagnostic.severity.WARN] = diagnostic_icons.warn,
				[vim.diagnostic.severity.ERROR] = diagnostic_icons.error,
			},
		},
	})
end

-- Returns the lspconfig plugin for lazy.nvim
return {
	"neovim/nvim-lspconfig",
	config = setup,
	cond = utils.firenvim_not_active,
	event = { "BufReadPre", "BufNewFile" },

	-- Mason lspconfig for automatic server setup
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim", dependencies = "mason.nvim" },
	},

	keys = {
		{ "grd", desc = descriptions.definition },
		{ "grD", desc = descriptions.declaration },
		{ "grs", desc = descriptions.signature_help },
		{ "<Leader>f", mode = { "n", "x" }, desc = descriptions.format },
		{ "grl", desc = descriptions.diagnostic_window },
	},
}
