-- Completion engine configuration
-- Currently using blink.cmp

-- Get the utility module
local utils = require("utils")

-- Returns the completion engine for lazy.nvim
return {
	"Saghen/blink.cmp",
	version = "*",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {

		-- Compatibility module for nvim-cmp sources
		{
			"Saghen/blink.compat",
			version = "*",
			lazy = true,
			opts = {},
		},

		-- Regular completion within a buffer
		{ "hrsh7th/cmp-calc" },
		{ "ribru17/blink-cmp-spell" },
		{ "moyiz/blink-emoji.nvim" },

		-- AI autocompletion
		{ "supermaven-inc/supermaven-nvim" },
		{
			"tzachar/cmp-tabnine",
			build = "./install.sh",
		},
	},

	-- Configuration options
	opts = {

		-- Function to decide when to enable the completion engine
		enabled = function()
			return not vim.tbl_contains({ "Tybr", "typr" }, vim.bo.filetype)
				and vim.bo.buftype ~= "prompt"
				and vim.b.completion ~= false
		end,

		-- Sources configuration
		sources = {

			-- Default sources
			default = {
				"lsp",
				"path",
				"snippets",
				"buffer",
				"supermaven",
				"tabnine",
				"spell",
				"calc",
				"emoji",
			},

			-- Configuration for the providers
			providers = {

				-- Blink cmp built-in providers
				path = {
					kind = "Path",
				},
				buffer = {
					kind = "Buffer",
				},
				cmdline = {
					kind = "Command",
				},

				-- Blink cmp providers
				spell = {
					name = "Spell",
					module = "blink-cmp-spell",
					score_offset = -5,
					opts = {

						-- Enable the source only in `@spell` captures,
						-- and disable it in `@nospell` captures
						enable_in_context = function()
							--

							-- Get the captures at the current
							-- cursor position
							local captures =
								vim.treesitter.get_captures_at_cursor(0)

							-- Iterate over the captures
							for _, capture in ipairs(captures) do
								--

								-- If the cursor is in a spell capture,
								-- return true to enable the source
								if capture == "spell" then
									return true

								-- Otherwise, if the cursor
								-- is in a nospell capture,
								-- return false to disable the source
								elseif capture == "nospell" then
									return false
								end
							end
						end,
					},

					kind = "Spell",
				},

				emoji = {
					name = "Emoji",
					module = "blink-emoji",
					score_offset = -3,
					opts = { insert = true },
					kind = "Emoji",
				},

				-- Nvim cmp providers using blink.compat.
				--
				-- Note that the names must be the same
				-- as the names used for nvim-cmp.
				calc = {
					name = "calc",
					module = "blink.compat.source",
					score_offset = -10,
					kind = "Calculation",
				},
				supermaven = {
					name = "supermaven",
					module = "blink.compat.source",
					enabled = utils.firenvim_not_active,
					kind = "Supermaven",
				},
				tabnine = {
					name = "cmp_tabnine",
					module = "blink.compat.source",
					score_offset = -10,
					enabled = utils.firenvim_not_active,
					kind = "TabNine",
				},
			},
		},

		-- Key bindings
		keymap = {

			-- Don't inherit the default mappings
			preset = "none",

			-- Use Vim's default scrolling to scroll
			-- the documentation in the completion menu
			["<C-d>"] = {
				function(cmp) cmp.scroll_documentation_down(5) end,
				"fallback",
			},
			["<C-u>"] = {
				function(cmp) cmp.scroll_documentation_up(5) end,
				"fallback",
			},
			["<C-f>"] = {
				function(cmp) cmp.scroll_documentation_down(10) end,
				"fallback",
			},
			["<C-b>"] = {
				function(cmp) cmp.scroll_documentation_up(10) end,
				"fallback",
			},

			-- Use up and down arrow keys to select the previous
			-- and next item respectively
			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },

			-- Ctrl + p and Ctrl + n work similarly
			-- to the up and down arrow keys
			["<C-p>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },

			-- Super tab
			["<Tab>"] = {

				-- Use tab to complete
				function(cmp)
					--

					-- If the snippet is active, accept it
					if cmp.snippet_active() then
						return cmp.accept()

					-- Otherwise, select and accept the next item
					else
						return cmp.select_and_accept()
					end
				end,

				-- Use tab to advance the snippet as well
				"snippet_forward",
				"fallback",
			},

			-- Use Shift + Tab to move backwards in a snippet
			["<S-Tab"] = { "snippet_backward", "fallback" },

			-- Use Ctrl + y to select and accept
			["<C-y>"] = { "select_and_accept" },

			-- Use Ctrl + e to exit the cmp menu
			["<C-e>"] = { "cancel", "fallback" },

			-- Vim's default mapping for completions
			["<C-Space>"] = { "show" },
		},

		-- Completion configuration
		completion = {

			-- Never fill in brackets
			accept = { auto_brackets = { enabled = false } },

			-- Configure the completion menu
			menu = {
				draw = {
					columns = {
						{ "kind_icon" },
						{ "label", "label_description", gap = 1 },
						{ "kind" },
					},

					-- Configure the components
					components = {

						-- Have a space between the label and the label detail
						label = {
							text = function(ctx)
								return string.format(
									"%s %s",
									vim.trim(ctx.label),
									vim.trim(ctx.label_detail)
								)
							end,
						},
					},
				},
			},

			list = {
				selection = {

					-- Change the preselect behaviour to only work
					-- when the snippet is not active
					preselect = function()
						return not require("blink.cmp").snippet_active({
							direction = 1,
						})
					end,
				},
			},

			-- Show documentation automatically
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 250,
			},
		},

		-- Enable signature help
		signature = { enabled = true },

		-- Fuzzy finder configuration
		fuzzy = {

			-- Set label as the primary source for the spell source
			sorts = {
				function(item_1, item_2)
					local sort = require("blink.cmp.fuzzy.sort")
					if
						item_1.source_id == "spell"
						and item_2.source_id == "spell"
					then
						return sort.label(item_1, item_2)
					end
				end,

				-- Default order to fall back on
				"score",
				"sort_text",
			},
		},

		-- Configuration for the appearance
		appearance = {
			nerd_font_variant = "mono",
			kind_icons = require("shared_configs").icons.kind,
		},
	},

	-- The config function
	config = function(_, opts)
		--

		-- Get the completion item kinds
		local completion_item_kinds =
			require("blink.cmp.types").CompletionItemKind

		-- Iterate over all the providers
		for _, provider in pairs(opts.sources.providers or {}) do
			--

			-- If the kind is given
			if provider.kind then
				--

				-- Get the index of the new kind
				local kind_index = #completion_item_kinds + 1

				-- Map the kind index to the kind
				completion_item_kinds[kind_index] = provider.kind

				-- Map the kind to the kind index.
				-- This is how the CompletionItemKind works in blink.cmp,
				-- so we need to map it both ways.
				completion_item_kinds[provider.kind] = kind_index

				-- Save the original transform items function
				local original_transform_items = provider.transform_items

				-- Override the transform items function
				provider.transform_items = function(ctx, items)
					--

					-- Get the items after using the original transform
					-- items if it exists
					items = original_transform_items
							and original_transform_items(ctx, items)
						or items

					-- Iterate over the items
					for _, item in ipairs(items) do
						--

						-- Set the item kind
						item.kind = kind_index or item.kind
					end

					-- Return the list of items
					return items
				end
			end

			-- Unset the kind and the source name to pass blink.cmp validation
			provider.kind = nil
		end

		-- Set up Supermaven for AI autocompletion
		require("supermaven-nvim").setup({
			log_level = "info",
			disable_inline_completion = true,
			disable_keymaps = true,
		})

		-- Set up blink.cmp
		require("blink.cmp").setup(opts)
	end,
}
