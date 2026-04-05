-- Configuration for preview related plugins

-- Return the preview related plugins for lazy.nvim
return {

	-- Better looking help files
	{ "OXY2DEV/helpview.nvim" },

	-- Markdown previewer in HTML form
	{
		"brianhuster/live-preview.nvim",
		ft = { "markdown", "svg" },
		cmd = "LivePreview",
	},

	-- Typst PDF previewer
	{

		"chomosuke/typst-preview.nvim",
		ft = "typst",
		version = "1.*",

		-- Use Mason's installation of tinymist
		opts = {
			dependencies_bin = {
				tinymist = "tinymist",
			},
		},
	},

	-- Plugin to preview colours
	{
		"brenoprata10/nvim-highlight-colors",
		opts = {},

		-- Additional package specifications
		-- for the colours plugin
		specs = {
			"Saghen/blink.cmp",

			-- Add configuration to show the colour in the completion menu
			opts = function(_, opts)

				-- Function to swap the kind icon for the coloured square
				local function swap_kind_icon(ctx)

					-- The default kind icon
					local icon = ctx.kind_icon

					-- If using the LSP source
					if ctx.item.source_name == "LSP" then

						-- Get the colour item from the plugin
						local color_item =
							require("nvim-highlight-colors").format(
								ctx.item.documentation,
								{ kind = ctx.kind }
							)

						-- If the colour item exists,
						-- set the icon to it
						if color_item and color_item.abbr ~= "" then
							icon = color_item.abbr
						end
					end

					-- Return the icon with the icon gap
					return icon .. ctx.icon_gap
				end

				-- Function to highlight the kind icon
				local function highlight_kind_icon(ctx)

					-- Get the default highlight group
					local highlight = "BlinkCmpKind" .. ctx.kind

					-- If using the LSP source
					if ctx.item.source_name == "LSP" then

						-- Get the colour item from the plugin
						local color_item =
							require("nvim-highlight-colors").format(
								ctx.item.documentation,
								{ kind = ctx.kind }
							)

						-- If the highlight exists,
						-- set the highlight group to it
						if color_item and color_item.abbr_hl_group then
							highlight = color_item.abbr_hl_group
						end
					end

					-- Return the highlight group
					return highlight
				end

				-- Extend the plugin configuration with the new functions
				return vim.tbl_deep_extend("force", opts or {}, {
					completion = {
						menu = {
							draw = {
								components = {

									-- Customize the drawing of kind icons
									kind_icon = {
										text = swap_kind_icon,
										highlight = highlight_kind_icon,
									},
								},
							},
						},
					},
				})
			end,
		},
	},
}
