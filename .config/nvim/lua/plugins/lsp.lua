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
	diagnostic_prev = "Go to the previous diagnostic",
	diagnostic_next = "Go to the next diagnostic",
}

-- The list of root files
local root_files = {

	-- Default root files from lspconfig
	".luarc.json",
	".luarc.jsonc",
	".luacheckrc",
	".stylua.toml",
	"stylua.toml",
	"selene.toml",
	"selene.yml",

	-- Wezterm configuration file
	"wezterm.lua",

	-- Awesomewm configuration file
	"rc.lua",

	-- Yazi init.lua and main.lua files
	"init.lua",
	"main.lua",
}

-- Function to set up the lsp
local function setup()
	--

	-- Gets the lspconfig module
	local lspconfig = require("lspconfig")

	-- Get the default configuration from lspconfig
	local lspconfig_defaults = lspconfig.util.default_config

	-- Add cmp_nvim_lsp capabilities settings to lspconfig
	lspconfig_defaults.capabilities = vim.tbl_deep_extend(
		"force",
		lspconfig_defaults.capabilities,
		require("blink.cmp").get_lsp_capabilities()
	)

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

			-- Key bind to go to the previous diagnostic
			vim.keymap.set(
				"n",
				"[d",
				function() vim.diagnostic.goto_prev() end,
				vim.tbl_extend(
					"error",
					opts,
					{ desc = descriptions.diagnostic_prev }
				)
			)

			-- Key bind to go to the next diagnostic
			vim.keymap.set(
				"n",
				"]d",
				function() vim.diagnostic.goto_next() end,
				vim.tbl_extend(
					"error",
					opts,
					{ desc = descriptions.diagnostic_next }
				)
			)
		end,
	})

	-- Gets the shared configs file
	local shared_configs = require("shared_configs")

	-- Set up mason lsp config
	require("mason-lspconfig").setup({

		-- The handlers for the various LSPs
		handlers = {

			-- Default server handler, which uses
			-- lspconfig's default set up function
			function(server_name) lspconfig[server_name].setup({}) end,

			-- Configure lua ls
			lua_ls = function()
				--

				-- Gets the runtime path for Neovim
				-- Comment out when configuring other applications,
				-- like awesomewm or wezterm
				local runtime_path = vim.split(package.path, ";")
				table.insert(runtime_path, "lua/?.lua")
				table.insert(runtime_path, "lua/?/init.lua")

				-- Set up lua ls using lspconfig
				lspconfig.lua_ls.setup({

					-- Disable formatting
					init_options = {
						documentFormatting = false,
						documentRangeFormatting = false,
					},

					-- Set the root directory
					root_dir = function(fname)
						--

						-- Tries to get the root directory
						local root = lspconfig.util.root_pattern(
							unpack(root_files)
						)(fname)

						-- If the root directory exists
						-- and is not the Neovim configuration directory
						if root and root ~= vim.env.HOME then
							--

							-- Then immediately return the root directory
							return root
						end

						-- Otherwise, tries to find the lua folder in the
						-- Neovim configuration directory
						root = lspconfig.util.root_pattern("lua/")(fname)

						-- If the root directory is found
						if root then
							--

							-- Then return the lua folder in the
							-- Neovim configuration directory
							return root .. "/lua/"
						end

						-- Otherwise, tries to find the nearest git repository
						return lspconfig.util.find_git_ancestor(fname)
					end,

					settings = {
						Lua = {

							-- Disable telemetry
							telemetry = { enable = false },

							-- Tell the language server which
							-- version of Lua is being used, which is
							-- LuaJIT in the case of Neovim
							runtime = {
								version = "LuaJIT",

								-- Comment out when configuring other
								-- applications, like awesomewm or wezterm
								path = runtime_path,
							},

							diagnostics = {

								-- Get the language server to
								-- recognise the vim global
								globals = { "vim" },
							},

							-- Disable formatting
							format = {
								enable = false,
							},

							-- Enable inlay hints
							hint = {
								enable = true,
								arrayIndex = "Enable",
								setType = true,
							},

							workspace = {
								checkThirdParty = false,
								library = {

									-- Make the server aware of
									-- Neovim runtime files
									vim.fn.expand("$VIMRUNTIME/lua"),
									vim.fn.stdpath("config") .. "/lua",
								},
							},
						},
					},
				})
			end,

			-- Configure vstsls
			vtsls = function()
				lspconfig.vtsls.setup({

					-- Disable formatting
					init_options = {
						documentFormatting = false,
						documentRangeFormatting = false,
					},
				})
			end,

			-- Configure rust analyzer to enable inlay hints
			rust_analyzer = function()
				lspconfig.rust_analyzer.setup({
					on_attach = function(_, buffer_number)
						vim.lsp.inlay_hint.enable(
							true,
							{ bufnr = buffer_number }
						)
					end,

					settings = {
						["rust-analyzer"] = {
							checkOnSave = true,
							check = {
								enable = true,
								command = "clippy",
								features = "all",
							},
							procMacro = {
								enable = true,
							},
						},
					},
				})
			end,
		},
	})

	-- Set up language servers not installed by Mason

	-- Set up efm language server
	lspconfig.efm.setup({

		-- Enable formatting
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
		},
	})

	-- Set up LTEX+ LSP
	lspconfig.ltex_plus.setup({
		settings = {
			ltex = {
				language = "en-GB",
			},
		},
	})

	-- Set up basedpyright
	lspconfig.basedpyright.setup({

		-- Disable formatting.
		-- By right, basedpyright doesn't do formatting,
		-- but this is to ensure that it never tries to
		-- clash with Ruff to format my code.
		init_options = {
			documentFormatting = false,
			documentRangeFormatting = false,
		},

		settings = {
			basedpyright = {

				-- Disable organising imports as Ruff already does that
				disableOrganizeImports = true,
			},
		},
	})

	-- Get the diagnostic icons
	local diagnostic_icons = shared_configs.icons.diagnostics

	-- Enable virtual_text
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

		-- Autocompletion
		"blink.cmp",

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
		{
			"[d",
			mode = "n",
			desc = descriptions.diagnostic_prev,
		},
		{
			"]d",
			mode = "n",
			desc = descriptions.diagnostic_next,
		},
	},
}
