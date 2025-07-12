#!/bin/sh

# Indicator powered by Dunst notifications for volume and brightness levels

# Reference:
# https://gitlab.com/Nmoleo/i3-volume-brightness-indicator

# The help text for the script
HELP_TEXT="
A script to use show volume and brightness levels using Dunst notifications.
It is adapted from EndeavourOS' i3 volume-brightness script.

Usage:
  dunst-indicator.sh <operation> <amount>

  The operation can be the following:
    - volume-up
    - volume-down
    - volume-mute
	- mic-mute
    - brightness-up
    - brightness-down

  Both of the arguments are required for all operations
  except for the volume-mute and mic-mute operations.

  The amount is in percentages without the % symbol, from 0 - 100.
"

# The maximum volume level
MAX_VOLUME=100

# The spacer to use to space out the value and the icon
SPACER=' '

# Function to get the volume level
get_volume() {

	# Get the raw volume level from pactl.
	# For some reason, pulse audio (pactl)
	# is way faster than wire plumber (wpctl),
	# and also returns the volume as an integer percentage
	# and not as a float, so we are using pactl instead of wpctl.
	volume=$(pactl get-sink-volume @DEFAULT_SINK@ |
		grep -Po '\d{1,3}(?=%)' | head -1)

	# Get whether the audio is muted
	is_muted=$(pactl get-sink-mute @DEFAULT_SINK@ |
		grep -Po '(?<=Mute: )(yes|no)')
}

# Function to get the volume icon
get_volume_icon() {

	# Get the volume level
	get_volume

	# Initialise the volume icon
	volume_icon=

	# If the volume is muted, show the muted icon
	if [ "$is_muted" = 'yes' ]; then
		volume_icon=""
	elif [ "$volume" -le 10 ]; then
		volume_icon=""
	elif [ "$volume" -lt 50 ]; then
		volume_icon=""
	else
		volume_icon=""
	fi
}

# Function to show the volume notification
show_volume_notification() {

	# Get the volume icon if it hasn't been obtained,
	# which is every time except when increasing the volume
	# (implicitly calls get_volume also)
	if [ -z "$volume_icon" ]; then
		get_volume_icon
	fi

	# Display the notification using dunstify
	dunstify -t 1000 -r 2593 \
		-u normal "$volume%$SPACER$volume_icon" \
		-h int:value:"$volume"
}

# Function to get the mic volume level
get_mic_volume() {

	# Get the mic volume level from pactl.
	mic_volume=$(pactl get-source-volume @DEFAULT_SOURCE@ |
		grep -Po '\d{1,3}(?=%)' | head -1)

	# Get whether the mic is muted
	mic_is_muted=$(pactl get-source-mute @DEFAULT_SOURCE@ |
		grep -Po '(?<=Mute: )(yes|no)')
}

# Function to get mic icon
get_mic_icon() {

	# Get the mic volume level
	get_mic_volume

	# Initialise the mic icon
	mic_icon=

	# If the mic is muted, show the muted icon
	if [ "$mic_is_muted" = 'yes' ]; then
		mic_icon=""
	else
		mic_icon=""
	fi
}

# Function to show the mic notification
show_mic_notification() {

	# Get the mic icon (implicitly calls get brightness also)
	get_mic_icon

	# Display the notification using dunstify
	dunstify -t 1000 -r 2593 \
		-u normal "$mic_volume%$SPACER$mic_icon" \
		-h int:value:"$mic_volume"
}

# Function to get the brightness level
get_brightness() {

	# Get the brightness level from brightnessctl
	brightness=$(brightnessctl info | grep -Po '\d{1,3}%' | head -n 1)

	# Remove the % at the end of the brightness level
	brightness="${brightness%?}"
}

# Function to get the brightness icon
get_brightness_icon() {

	# Get the brightness level
	get_brightness

	# Initialise the brightness icon
	brightness_icon=

	# Get the brightness icons for the specific brightness levels
	if [ "$brightness" -le 10 ]; then
		brightness_icon=""
	elif [ "$brightness" -le 21 ]; then
		brightness_icon=""
	elif [ "$brightness" -le 32 ]; then
		brightness_icon=""
	elif [ "$brightness" -le 43 ]; then
		brightness_icon=""
	elif [ "$brightness" -le 54 ]; then
		brightness_icon=""
	elif [ "$brightness" -le 65 ]; then
		brightness_icon=""
	elif [ "$brightness" -le 76 ]; then
		brightness_icon=""
	elif [ "$brightness" -le 87 ]; then
		brightness_icon=""
	else
		brightness_icon=""
	fi
}

# Function to show the brightness notification
show_brightness_notification() {

	# Get the brightness icon (implicitly calls get brightness also)
	get_brightness_icon

	# Display the notification using dunstify
	dunstify -t 1000 -r 2593 \
		-u normal "$brightness%$SPACER$brightness_icon" \
		-h int:value:"$brightness"
}

# Main script
case $1 in

# Increasing the volume
volume-up)

	# Get the current volume level
	get_volume

	# If the volume with the amount added is greater than the max volume,
	# set the volume to the max volume
	if [ $(("$volume" + "$2")) -gt "$MAX_VOLUME" ]; then
		pactl set-sink-volume @DEFAULT_SINK@ $MAX_VOLUME%

	# Otherwise, increase the volume by that amount
	else
		pactl set-sink-volume @DEFAULT_SINK@ +"$2"%
	fi

	# Show the volume notification
	show_volume_notification
	;;

# Decreasing the volume
volume-down)

	# Decrease the volume by the amount given
	pactl set-sink-volume @DEFAULT_SINK@ -"$2"%

	# Show the volume notification
	show_volume_notification
	;;

# Muting the audio
volume-mute)

	# Toggle the mute on the audio
	pactl set-sink-mute @DEFAULT_SINK@ toggle

	# Show the volume notification
	show_volume_notification
	;;

# Muting the mic
mic-mute)

	# Toggle the mute on the mic
	pactl set-source-mute @DEFAULT_SOURCE@ toggle

	# Show the mic notification
	show_mic_notification
	;;

# Increasing the brightness
brightness-up)

	# Increase the brightness
	brightnessctl set +"$2"%

	# Show the brightness notification
	show_brightness_notification
	;;

# Decreasing the brightness
brightness-down)

	# Decrease the brightness
	brightnessctl set "$2"%-

	# Show the brightness notification
	show_brightness_notification
	;;

# Wrong arguments
*)

	# Show the help text
	echo "$HELP_TEXT"

	# Exit with an error code
	exit 1
	;;
esac

# vi: tabstop=4
