-- Configuration for basedpyright
return {

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
}
