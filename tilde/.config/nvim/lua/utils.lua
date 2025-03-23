-- Utilities

-- The Lua module
local M = {}

-- Function to check if the Firenvim is active
function M.firenvim_not_active() return not vim.g.started_by_firenvim end

-- Function to titlecase a string
function M.titlecase(str)
	return str:gsub(
		"(%a)(%w*)",
		function(first_character, rest_of_the_word)
			return string.upper(first_character) .. rest_of_the_word
		end
	)
end

-- Create the function to trim the spaces off of the icons.
--
-- This function edits the table of icons
-- and does not return anything.
M.trim_icons = function(icons)
	--

	-- Iterate over the table of icons
	for key, value in pairs(icons) do
		--

		-- If the value is a string,
		-- trim the spaces off of the icon
		if type(value) == "string" then icons[key] = vim.trim(value) end

		-- If the value is a table,
		-- call the function recursively
		-- on the table.
		if type(value) == "table" then M.trim_icons(value) end
	end
end

-- Returns the module
return M
