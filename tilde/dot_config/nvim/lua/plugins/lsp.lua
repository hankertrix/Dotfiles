-- LSP configuration

-- Gets the module with the utilities
local utils = require("utils")

-- The table of descriptions
local descriptions = {
	hover = "Show hover information",
	definition = "Go to definition",
	declaration = "Go to declaration",
	implementation = "List all implementations in a quickfix window",
	type_definition = "Go to type definition",
	references = "List all references in a quickfix window",
	signature_help = "Show signature information",
	rename = "Renames all references to the symbol under the cursor",
	format = "Formats the buffer using the LSP",
	code_action = "Select a code action",
	diagnostic_window = "Show diagnostics in a floating window",
}

-- The list of externally installed LSPs
local externally_installed_lsps = {
	"basedpyright",
	"efm",
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

			-- Key bind to show hover information
			vim.keymap.set(
				"n",
				"K",
				function() vim.lsp.buf.hover() end,
				vim.tbl_extend("error", opts, { desc = descriptions.hover })
			)

			-- Key bind to go to definition
			vim.keymap.set(
				"n",
				"gd",
				function() vim.lsp.buf.definition() end,
				vim.tbl_extend(
					"error",
					opts,
					{ desc = descriptions.definition }
				)
			)

			-- Key bind to go to declaration
			vim.keymap.set(
				"n",
				"gD",
				function() vim.lsp.buf.declaration() end,
				vim.tbl_extend(
					"error",
					opts,
					{ desc = descriptions.declaration }
				)
			)

			-- Key bind to go to implementation
			vim.keymap.set(
				"n",
				"gi",
				function() vim.lsp.buf.implementation() end,
				vim.tbl_extend(
					"error",
					opts,
					{ desc = descriptions.implementation }
				)
			)

			-- Key bind to go to type definition
			vim.keymap.set(
				"n",
				"go",
				function() vim.lsp.buf.type_definition() end,
				vim.tbl_extend(
					"error",
					opts,
					{ desc = descriptions.type_definition }
				)
			)

			-- Key bind to go to references
			vim.keymap.set(
				"n",
				"gr",
				function() vim.lsp.buf.references() end,
				vim.tbl_extend(
					"error",
					opts,
					{ desc = descriptions.references }
				)
			)

			-- Key bind to show signature help
			vim.keymap.set(
				"n",
				"gs",
				function() vim.lsp.buf.signature_help() end,
				vim.tbl_extend(
					"error",
					opts,
					{ desc = descriptions.signature_help }
				)
			)

			-- Key bind to rename the variable
			vim.keymap.set(
				"n",
				"<F2>",
				function() vim.lsp.buf.rename() end,
				vim.tbl_extend("error", opts, { desc = descriptions.rename })
			)

			-- Key bind to format the buffer
			vim.keymap.set(
				{ "n", "x" },
				"<F3>",
				function() vim.lsp.buf.format({ async = true }) end,
				vim.tbl_extend("error", opts, { desc = descriptions.format })
			)

			-- Key bind to format the buffer as well
			vim.keymap.set(
				{ "n", "x" },
				"<Leader>f",
				function() vim.lsp.buf.format({ async = true }) end,
				vim.tbl_extend("error", opts, { desc = descriptions.format })
			)

			-- Key bind to show code actions
			vim.keymap.set(
				"n",
				"<F4>",
				function() vim.lsp.buf.code_action() end,
				vim.tbl_extend(
					"error",
					opts,
					{ desc = descriptions.code_action }
				)
			)

			-- If a range is selected and a range code action is available,
			-- use the range code action
			if vim.lsp.buf.range_code_action then
				vim.keymap.set(
					"x",
					"<F4>",
					function() vim.lsp.buf.range_code_action() end,
					vim.tbl_extend(
						"error",
						opts,
						{ desc = descriptions.code_action }
					)
				)
			else
				vim.keymap.set(
					"x",
					"<F4>",
					function() vim.lsp.buf.code_action() end,
					vim.tbl_extend(
						"error",
						opts,
						{ desc = descriptions.code_action }
					)
				)
			end

			-- Key bind to show diagnostics
			vim.keymap.set(
				"n",
				"gl",
				function() vim.diagnostic.open_float() end,
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

	dependencies = {

		-- Mason lspconfig for automatic server setup
		{ "williamboman/mason-lspconfig.nvim", dependencies = "mason.nvim" },

		-- Snippets
		{ "rafamadriz/friendly-snippets" },
	},

	keys = {
		{ "K", mode = "n", desc = descriptions.hover },
		{ "gd", mode = "n", desc = descriptions.definition },
		{
			"gD",
			mode = "n",
			desc = descriptions.declaration,
		},
		{
			"gi",
			mode = "n",
			desc = descriptions.implementation,
		},
		{
			"go",
			mode = "n",
			desc = descriptions.type_definition,
		},
		{ "gr", mode = "n", desc = descriptions.references },
		{
			"gs",
			mode = "n",
			desc = descriptions.signature_help,
		},
		{ "<F2>", mode = "n", desc = descriptions.rename },
		{ "<F3>", mode = { "n", "x" }, desc = descriptions.format },
		{ "<Leader>f", mode = { "n", "x" }, desc = descriptions.format },
		{
			"<F4>",
			mode = { "n", "x" },
			desc = descriptions.code_action,
		},
		{
			"gl",
			mode = "n",
			desc = descriptions.diagnostic_window,
		},
	},
}
