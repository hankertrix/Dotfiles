-- Configurations that are shared between different plugins

-- Initialise the module
local M = {}

-- Set the max line length to 80
M.max_line_length = 80

-- Set the theme
M.theme = "bluloco"

-- Set the light theme
M.light_theme = "bluloco-light"

-- Set the dark theme
M.dark_theme = "bluloco-dark"

-- The list of icons that I want to use
M.icons = {
	kind = {
		Array = "󰅪",
		Boolean = "",
		Class = "󰠱",
		Color = "󰏘",
		Constant = "󰏿",
		Constructor = "",
		Control = "",
		Enum = "",
		EnumMember = "",
		Error = "",
		Event = "",
		Field = "󰜢",
		File = "󰈙",
		Folder = "󰉋",
		Function = "󰊕",
		Interface = "",
		Key = "󰌋",
		Keyword = "󱕵",
		Macro = "",
		Magic = "󱡄",
		Method = "",
		Module = "󱒌",
		Namespace = "󰌗",
		Null = "󰟢",
		Number = "",
		Numeric = "󰎠",
		Object = "󰅩",
		Operator = "",
		Package = "󰏖",
		Parameter = "󰗴",
		Property = "",
		Reference = "",
		Snippet = "",
		StaticMethod = "󱇯",
		String = "",
		Struct = "󰆼",
		Text = "",
		TypeAlias = "󱄀",
		TypeParameter = "",
		Unit = "",
		Unknown = "",
		Value = "󱀍",
		Variable = "󰫧",

		-- Miscellaneous
		Collapsed = "",

		-- Kind icons for completion sources

		-- Regular completion sources
		Path = "",
		Buffer = "",
		Command = "",
		Spell = "",
		Emoji = "󰱨",
		Calculation = "",

		-- AI code completion
		TabNine = "󰏚",
		Supermaven = "",
		Codeium = "󰘦",
		Copilot = "",
	},

	-- Diagnostic icons
	diagnostics = {
		info = "",
		hint = "",
		warn = "",
		error = "",
	},

	-- Git icons
	git = {
		modified = "", -- Modified "M"
		ft_changed = "", -- File type changed "T"
		added = "", -- Added "A"
		deleted = "", -- Deleted "D"
		renamed = "", -- Renamed "R"
		copied = "", -- Copied "C"
		unmerged = "", -- Unmerged "U"
		unknown = "", -- Unknown change type "X"
		untracked = "󱋽", -- Untracked
		ignored = "", -- Ignored
		commit = "󰜘", -- Commit
		staged = "", -- Staged changes
	},
}

-- The list of disabled file types
M.disabled_file_types = {
	"help",
	"checkhealth",
	"netrw",
	"qf",
	"gitcommit",
	"gitrebase",

	-- Plugin specific filetypes
	"packer",
	"dirvish",
	"dirbuf",
	"diff",
	"mason",
	"lazy",
	"lspinfo",
	"null-ls-info",
	"fugitive",
	"undotree",
	"aerial",
	"harpoon",
	"minifiles",
	"trouble",
	"spectre_panel",
	"typr",
	"typrstats",
	"Tybr",
	"TybrStats",
	"Trouble",
	"NvimTree",
	"TelescopePrompt",
	"WhichKey",

	-- Neogit buffers
	"NeogitGitCommandHistory",
	"NeogitStatus",
	"NeogitLogView",
	"NeogitReflogView",
	"NeogitCommitView",
	"NeogitCommitSelectView",
	"NeogitRefsView",
	"NeogitConsole",
	"NeogitDiffView",

	-- Neogit popup
	"NeogitPopup",
}

-- Returns the module
return M
