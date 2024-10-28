#!/bin/bash
# original source: https://gitlab.com/Nmoleo/i3-volume-brightness-indicator

# taken from here: https://gitlab.com/Nmoleo/i3-volume-brightness-indicator

# See README.md for usage instructions
bar_color="#7f7fff"
volume_step=1
brightness_step=2.5
max_volume=100

# Uses regex to get volume from pactl
function get_volume {
    pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]{1,3}(?=%)' | head -1
}

# Uses regex to get mute status from pactl
function get_mute {
    pactl get-sink-mute @DEFAULT_SINK@ | grep -Po '(?<=Mute: )(yes|no)'
}

# Uses regex to get brightness from xbacklight
function get_brightness_xbacklight {
    xbacklight | grep -Po '[0-9]{1,3}' | head -n 1
}

# Uses regex to get brightness from gummyconf.json file
function get_brightness_gummy {

    # Get the backlight settings from the gummyconf.json file
    backlight_settings=$(sed -n '/backlight/,$p' ~/.config/gummyconf.json)

    # Get the max value of the backlight
    max_value=$(echo "$backlight_settings" |
        sed -nr 's/^.*max[": \t]*([0-9]+).*$/\1/p' |
        head -n 1)

    # Get the current value of the backlight
    current_value=$(echo "$backlight_settings" |
        sed -nr 's/^.*val[": \t]*([0-9]+).*$/\1/p' |
        head -n 1)

    # Print the current value as a percentage of the maximum value
    echo $((current_value * 100 / max_value))
}

# Get the brightness from xsct
function get_brightness {

    # Get the current brightness value
    current_value=$(xsct | head -n 1 | cut -d' ' -f6)

    # Get the part of the brightness value before the decimal point
    value_before_decimal=$(echo "$current_value" | cut -d'.' -f1)

    # Get the part of the brightness value after the decimal point
    value_after_decimal=$(echo "$current_value" | cut -d'.' -f2)

    # Get the length of the value after the decimal point
    value_after_decimal_length=${#value_after_decimal}

    # Round the value after the decimal point
    value_after_decimal_rounded=$((value_after_decimal / (10 ** (value_after_decimal_length - 2))))

    # Get the current value
    current_value=$((100 * value_before_decimal + value_after_decimal_rounded))

    # Print the current value
    echo "$current_value"
}

# Returns a mute icon, a volume-low icon, or a volume-high icon, depending on the volume
function get_volume_icon {
    volume=$(get_volume)
    mute=$(get_mute)
    if [ "$volume" -eq 0 ] || [ "$mute" == "yes" ] ; then
        volume_icon=""
    elif [ "$volume" -lt 50 ]; then
        volume_icon=""
    else
        volume_icon=""
    fi
}

# Always returns the same icon - I couldn't get the brightness-low icon to work with fontawesome
function get_brightness_icon {
    brightness_icon=""
}

# Displays a volume notification using dunstify
function show_volume_notif {
    volume=$(get_mute)
    get_volume_icon
    dunstify -t 1000 -r 2593 -u normal "$volume_icon    $volume%" -h int:value:$volume -h string:hlcolor:$bar_color
}

# Displays a brightness notification using dunstify
function show_brightness_notif {
    brightness=$(get_brightness)
    get_brightness_icon
    dunstify -t 1000 -r 2593 -u normal "$brightness_icon   $brightness%" -h int:value:$brightness -h string:hlcolor:$bar_color
}

# Main function - Takes user input, "volume_up", "volume_down", "brightness_up", or "brightness_down"
case $1 in
    volume_up)
    # Unmutes and increases volume, then displays the notification
    pactl set-sink-mute @DEFAULT_SINK@ 0
    volume=$(get_volume)
    if [ $(( "$volume" + "$volume_step" )) -gt $max_volume ]; then
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
    # xbacklight -inc $brightness_step -time 0
    # gummy -b +5
    xsct -d 0 0.05
    show_brightness_notif
    ;;

    brightness_down)
    # Decreases brightness and displays the notification
    # xbacklight -dec $brightness_step -time 0
    # gummy -b -5
    xsct -d 0 -0.05
    show_brightness_notif
    ;;
esac
