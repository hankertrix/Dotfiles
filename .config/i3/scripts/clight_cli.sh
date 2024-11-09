#!/usr/bin/env sh

# The script to use clight to control the brightness
# of the screen.

# The function to get the current brightness
get_brightness() {

    # Get the raw value from the dbus service
    raw_value=$(busctl --user get-property org.clight.clight \
        /org/clight/clight org.clight.clight BlPct | cut -d ' ' -f 2)

    # Truncate the value to 2 decimal places
    truncated_value=$(printf "%.2f" "$raw_value")

    # Get the part before the decimal point
    integer_part=$(echo "$truncated_value" | cut -d '.' -f 1)

    # Get the part after the decimal point
    decimal_part=$(echo "$truncated_value" | cut -d '.' -f 2)

    # Get the brightness value as a percentage out of 100%
    brightness_percentage=$((integer_part * 100 + decimal_part))

    # Return the brightness percentage
    echo "$brightness_percentage"
}

# The function to increase the brightness
increase_brightness() {
    busctl --user call org.clight.clight \
        /org/clight/clight org.clight.clight IncBl "d" "$1"
}

# The function to decrease the brightness
decrease_brightness() {
    busctl --user call org.clight.clight \
        /org/clight/clight org.clight.clight DecBl "d" "$1"
}

# The main function
case $1 in
get_brightness) get_brightness ;;
increase_brightness) increase_brightness "$2" ;;
decrease_brightness) decrease_brightness "$2" ;;
esac
