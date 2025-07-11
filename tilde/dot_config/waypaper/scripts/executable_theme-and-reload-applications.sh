#!/bin/sh

# Initialise the palette
palette=

# Get the palette from the wallpaper passed as the first argument
case $1 in
*light*)
	palette='light16'
	;;
*dark*)
	palette='dark16'
	;;
esac

# Generate the colours from the wallpaper passed as the first argument
# and skip setting the terminal theme
wallust run "$1" --palette $palette --skip-sequences

# Reload waybar configuration
killall -SIGUSR2 waybar

# Restart dunst
systemctl --user restart dunst

# Update pywalfox
pywalfox update

# Kill nautilus
killall nautilus
