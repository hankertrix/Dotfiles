-- Utilities

-- The Lua module
local M = {}

-- Function to check if the firenvim is active
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

-- Returns the module
return M
