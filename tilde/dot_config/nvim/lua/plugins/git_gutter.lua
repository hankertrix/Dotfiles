-- Git gutter plugin configuration
-- Currently it's gitsigns

-- Gets the module with the utilities
local utils = require("utils")

-- The list of descriptions
local DESC = {
	StageHunk = "Stage hunk",
	ResetHunk = "Reset hunk",
	StageBuffer = "Stage buffer",
	ResetBuffer = "Reset buffer",
	PreviewHunk = "Preview hunk",
	PreviewHunkInline = "Preview hunk inline",
	BlameLine = "Blame line",
	DiffStaged = "Diff against the staged changes",
	DiffLastCommit = "Diff against the last commit",
	SetQFList = "Set quick fix list with the hunks in the current buffer",
	SetQFListAll = "Set quick fix list with the hunks in the current project",
	NextHunk = "Go to the next hunk",
	PrevHunk = "Go to the previous hunk",
}

-- Returns the git gutter plugin for lazy.nvim
return {
	"lewis6991/gitsigns.nvim",
	cond = utils.firenvim_not_active,
	event = "BufReadPre",
	opts = {
		on_attach = function(bufnr)

			-- Get the gitsigns module
			local gitsigns = require("gitsigns")

			-- The function to map the keybinds
			local function map(mode, l, r, desc, opts)

				-- Initialise the options
				opts = opts or {}

				-- Set the buffer
				opts.buffer = bufnr

				-- Set the description
				opts.desc = desc

				-- Set the keybind
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "]c", function()

				-- If it is in diff mode, just execute the regular ]c keybind
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end, DESC.NextHunk)
			map("n", "[c", function()

				-- If it is diff mode, just execute the regular [c keybind
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end, DESC.PrevHunk)

			-- Actions
			map("n", "<Leader>ga", gitsigns.stage_hunk, DESC.StageHunk)
			map("n", "<Leader>gr", gitsigns.reset_hunk, DESC.ResetHunk)
			map("n", "<Leader>gA", gitsigns.stage_buffer, DESC.StageBuffer)
			map("n", "<Leader>gR", gitsigns.reset_buffer, DESC.ResetBuffer)
			map("n", "<Leader>gp", gitsigns.preview_hunk, DESC.PreviewHunk)
			map(
				"n",
				"<Leader>gi",
				gitsigns.preview_hunk_inline,
				DESC.PreviewHunkInline
			)
			map(
				"n",
				"<Leader>gb",
				function() gitsigns.blame_line({ full = true }) end,
				DESC.BlameLine
			)
			map("n", "<Leader>gd", gitsigns.diffthis, DESC.DiffStaged)
			map(
				"n",
				"<Leader>gD",
				function() gitsigns.diffthis("~") end,
				DESC.DiffLastCommit
			)
			map("n", "<Leader>gq", gitsigns.setqflist, DESC.SetQFList)
			map(
				"n",
				"<Leader>gQ",
				function() gitsigns.setqflist("all") end,
				DESC.SetQFListAll
			)

			-- Visual mode actions
			map(
				"v",
				"<Leader>ga",
				function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end,
				DESC.StageHunk
			)
			map(
				"v",
				"<Leader>gr",
				function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end,
				DESC.ResetHunk
			)
		end,
	},
}
