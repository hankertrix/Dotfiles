-- The init.lua file to configure the Yazi plugins I use

-- Configure the relative motions plugin
require("relative-motions"):setup({
	show_numbers = "relative",
	show_motion = true,
})

-- Configure the git plugin
th.git = th.git or {

	-- Colours
	modified = ui.Style():fg("#0096DB"),
	added = ui.Style():fg("#239549"),
	untracked = ui.Style():fg("#B0B0B0"),
	ignored = ui.Style():fg("#B0B0B0"),
	deleted = ui.Style():fg("#D32752"),

	-- Unmerged
	updated = ui.Style():fg("#CD32C0"),

	-- Icons
	modified_sign = "",
	added_sign = "",
	untracked_sign = "󱋽",
	ignored_sign = "",
	deleted_sign = "",

	-- Unmerged
	updated_sign = "",
}

-- Set up the git plugin
require("git"):setup()
