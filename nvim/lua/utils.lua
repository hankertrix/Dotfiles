-- Utilities

-- The Lua module
local M = {}

-- Function to check if the firenvim is active
function M.firenvim_not_active()
    return not vim.g.started_by_firenvim
end

-- Function to titlecase a string
function M.titlecase(str)
    return str:gsub("(%l)(%w*)", function(first_character, rest_of_the_word)
        return string.upper(first_character) .. rest_of_the_word
    end)
end

-- Function to check if the package is installed
function M.status_ok(...)

    -- Initialise the packages variable
    local packages = ...

    -- If the arguments passed is not a table,
    -- Then put the arguments passed in a table
    if type(...) ~= "table" then packages = {...} end

    -- The number of packages installed
    local num_of_packages_installed = 0

    -- Iterates all the package names given
    for _, package_name in ipairs(packages) do

        -- Require the package in a protected call
        local installed, _ = pcall(require, package_name)

        -- If the package is installed
        -- Add one to the number of packages installed
        if installed then
            num_of_packages_installed = num_of_packages_installed + 1
        end

    end

    -- Returns true if the number of packages installed
    -- Is equal to the number of packages given
    -- Otherwise, return false
    return num_of_packages_installed == #packages

end


-- Function to check if a value is an a table
function M.has_value(table, value)

    -- Iterates the table
    for _, val in ipairs(table) do

        -- If the value is inside, return true
        if val == value then return true end

    end

    -- Returns false otherwise
    return false

end


-- Function to merge two array-like tables
function M.array_concat(table1, table2)
    for _, value in ipairs(table2) do table.insert(table1, value) end
    return table1
end


-- The list of plugin file types
M.plugin_file_types = {
    "netrw",
    "qf",
    "packer",
    "lazy",
    "dirvish",
    "fugitive",
    "harpoon",
    "aerial",
    "undotree",
    "mason",
    "TelescopePrompt",
    "NvimTree",
    "diff",
    "help",
}


-- Returns the module
return M


