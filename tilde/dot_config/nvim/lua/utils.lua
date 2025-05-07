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

-- Create the function to patch a plugin's runtime path
-- so it is loaded before anything else.
M.patch_plugin_runtime_path = function(plugin_path_pattern)
	--

	-- Initialise the plugin path
	local plugin_path = nil

	-- Get the runtime paths
	local runtime_paths = vim.opt.rtp:get()

	-- Iterate over the paths in the runtime paths
	for index, path in ipairs(runtime_paths) do
		--

		-- If the path is the plugin path
		if path:match(plugin_path_pattern) then
			--

			-- Remove the path and save it to the variable
			plugin_path = table.remove(runtime_paths, index)

			-- Break out of the loop
			break
		end
	end

	-- Insert markview path after ~/.config/nvim
	table.insert(runtime_paths, 2, plugin_path)

	-- Set the runtime paths to the modified one
	vim.opt.rtp = runtime_paths
end

-- Returns the module
return M
