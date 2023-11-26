-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- Set the colour scheme to Bluloco Dark
config.color_scheme = "Bluloco Dark"

-- Set the font to Cascadia Code Nerd Font
config.font = wezterm.font("CaskaydiaCove NFM")

-- Finally, return the configuration to wezterm
return config
