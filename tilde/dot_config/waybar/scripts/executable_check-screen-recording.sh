#!/bin/sh

# Script to check whether the screen is recording
# Reference:
# https://github.com/marcinjahn/dotfiles/blob/main/dot_config/waybar/scripts/executable_check_screen_recording.sh

# Check if the wl-screenrec process is running using pgrep
# -x ensures matching the exact process name
if pgrep -x wl-screenrec >/dev/null; then

	# If the screen is recording, output JSON for waybar
	# "text": Use a recording icon (like  from Nerd Fonts) or a simple dot ●
	# "class": "recording" allows CSS styling
	# "tooltip": Text shown on hover
	echo '{
		"text": "",
		"tooltip": "Screen Recording Active",
		"class": "recording"
	}' | tr -d '\n'

# Otherwise, if it isn't recording, use a different class to style the icon
# and change the tooltip
else
	echo '{
		"text": "",
		"tooltip": "Record Screen"
	}' | tr -d '\n'
fi
