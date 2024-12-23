-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then config = wezterm.config_builder() end

-- This is where you actually apply your config choices

-- Function to get the appearance in a reasonable way
local function get_appearance()
    --

    -- If Wezterm GUI is available then return the result
    -- of the get_appearance() call
    if wezterm.gui then return wezterm.gui.get_appearance() end

    -- Otherwise, return the dark mode
    return "Dark"
end

-- Function to get the colour scheme for the appearance
local function get_colour_scheme(appearance)
    --

    -- If the colour scheme is the dark theme,
    -- then return the Bluloco Dark theme
    if appearance:find("Dark") then return "Bluloco Dark" end

    -- Otherwise, return the Bluloco light theme
    return "Bluloco Light"
end

-- Set the colour scheme to the Bluloco colour scheme
config.color_scheme = get_colour_scheme(get_appearance())

-- Set the font to Cascadia Code Nerd Font
config.font = wezterm.font("CaskaydiaCove Nerd Font Mono")

-- Set the font to Maple Mono Nerd Font with Chinese characters
-- config.font = wezterm.font("Maple Mono NF CN")

-- Set the term environment variable to wezterm
config.term = "wezterm"

-- Set the font size to 12
config.font_size = 12

-- Set the underline thickness to 200%
config.underline_thickness = "200%"

-- Finally, return the configuration to wezterm
return config
