-- Configuration to set the colour scheme

-- Gets the module with the utilities
local utils = require("utils")

-- Returns the theme plugins for lazy.nvim
return {

    -- Bluloco theme
    {
        "uloco/bluloco.nvim",
        lazy = false,
        priority = 1000,
        dependencies = { "rktjmp/lush.nvim" },
        config = function()
            --

            -- Get the shared configuration
            local shared_configs = require("shared_configs")

            -- Get the colour scheme I want to use
            local colour_scheme = utils.firenvim_not_active()
                    and shared_configs.theme
                or shared_configs.light_theme

            -- Sets the theme
            vim.cmd("colorscheme " .. colour_scheme)
        end,
    },

    -- Auto theme switcher plugin
    {
        "f-person/auto-dark-mode.nvim",
        dependencies = { "bluloco.nvim" },
        config = function(_, _)
            --

            -- The function to check if the bluloco
            -- theme is set to change automatically
            local function is_auto()
                return require("bluloco").config.style == "auto"
            end

            -- Setup the auto theme switcher plugin
            require("auto-dark-mode").setup({
                update_interval = 1000,
                set_dark_mode = function()
                    if is_auto() then
                        vim.api.nvim_set_option_value("background", "dark", {})
                    end
                end,
                set_light_mode = function()
                    if is_auto() then
                        vim.api.nvim_set_option_value("background", "light", {})
                    end
                end,
            })
        end,
    },
}
