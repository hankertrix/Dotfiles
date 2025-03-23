#!/bin/bash
# original source: https://gitlab.com/Nmoleo/i3-volume-brightness-indicator

# taken from here: https://gitlab.com/Nmoleo/i3-volume-brightness-indicator

# See README.md for usage instructions
bar_color="#7f7fff"
volume_step=1
brightness_step=0.10
max_volume=100

# Uses regex to get volume from pactl
function get_volume {
    pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]{1,3}(?=%)' | head -1
}

# Uses regex to get mute status from pactl
function get_mute {
    pactl get-sink-mute @DEFAULT_SINK@ | grep -Po '(?<=Mute: )(yes|no)'
}

# Get the current brightness
function get_brightness {

    # Get the current brightness from clight
    ~/.config/i3/scripts/clight_cli.sh get_brightness
}

# Function to increase the brightness
function increase_brightness {

    # Increase the brightness using clight
    ~/.config/i3/scripts/clight_cli.sh increase_brightness "$1"
}

# Function to decrease the brightness
function decrease_brightness {

    # Decrease the brightness using clight
    ~/.config/i3/scripts/clight_cli.sh decrease_brightness "$1"
}

# Returns a mute icon, a volume-low icon,
# or a volume-high icon, depending on the volume
function get_volume_icon {
    volume=$(get_volume)
    mute=$(get_mute)
    if [ "$volume" -eq 0 ] || [ "$mute" == "yes" ]; then
        volume_icon=""
    elif [ "$volume" -lt 50 ]; then
        volume_icon=""
    else
        volume_icon=""
    fi
}

# Get the brightness icon
function get_brightness_icon {
    brightness=$(get_brightness)
    if [ "$brightness" -eq 0 ]; then
        brightness_icon="󰃞"
    elif [ "$brightness" -lt 50 ]; then
        brightness_icon="󰃟"
    else
        brightness_icon="󰃠"
    fi
}

# Displays a volume notification using dunstify
function show_volume_notif {
    volume=$(get_mute)
    get_volume_icon
    dunstify -t 1000 -r 2593 \
        -u normal "$volume_icon    $volume%" \
        -h int:value:"$volume" -h string:hlcolor:"$bar_color"
}

# Displays a brightness notification using dunstify
function show_brightness_notif {
    brightness=$(get_brightness)
    get_brightness_icon
    dunstify -t 1000 -r 2593 \
        -u normal "$brightness_icon   $brightness%" \
        -h int:value:"$brightness" -h string:hlcolor:"$bar_color"
}

# Main function
# Takes user input, "volume_up", "volume_down",
# "brightness_up", or "brightness_down"
case $1 in
volume_up)
    # Unmutes and increases volume, then displays the notification
    pactl set-sink-mute @DEFAULT_SINK@ 0
    volume=$(get_volume)
    if [ $(("$volume" + "$volume_step")) -gt $max_volume ]; then
        pactl set-sink-volume @DEFAULT_SINK@ $max_volume%
    else
        pactl set-sink-volume @DEFAULT_SINK@ +$volume_step%
    fi
    show_volume_notif
    ;;

volume_down)
    # Raises volume and displays the notification
    pactl set-sink-volume @DEFAULT_SINK@ -$volume_step%
    show_volume_notif
    ;;

volume_mute)
    # Toggles mute and displays the notification
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    show_volume_notif
    ;;

brightness_up)
    # Increases brightness and displays the notification
    increase_brightness "$brightness_step"
    show_brightness_notif
    ;;

brightness_down)
    # Decreases brightness and displays the notification
    decrease_brightness "$brightness_step"
    show_brightness_notif
    ;;
esac
