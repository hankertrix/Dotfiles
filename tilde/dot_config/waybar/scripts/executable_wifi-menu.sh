#!/bin/sh

# Wifi menu using rofi and nmcli
#
# Reference:
# https://github.com/ericmurphyxyz/rofi-wifi-menu/blob/master/rofi-wifi-menu.sh

# The number of times to try getting the password
MAX_RETRY_COUNT=3

# The connected symbol
CONNECTED_SYMBOL="󱘖"

# The options to enable and disable the wifi
ENABLE_WIFI_OPTION="󰖩 Enable Wi-Fi"
DISABLE_WIFI_OPTION="󰖪 Disable Wi-Fi"

# Send a notification so they know the script is working
# as nmcli takes a while to get the available wifi connections
notify-send -u low "Getting the list of available Wi-Fi networks..."

# Get a list of available wifi connections and turn it into a nice-looking list
wifi_list=$(nmcli --fields "SECURITY,SSID,ACTIVE" device wifi list |
	sed 1d | sort -k 4 -r | sed "s/  */ /g" | sed -E "s/WPA*.?\S//g" |
	sed "s/^--//g" | sed "s/ //g" | sed "/--/d")

# Get the connected wifi network
connected_network=$(echo "$wifi_list" | grep -Po ".*(?=yes)")

# Remove the active field from the wifi list
wifi_list=$(echo "$wifi_list" | sed "s/no\|yes//")

# If there is a connected network
if [ -n "$connected_network" ]; then

	# Remove the entries in the wifi list that match the connected network
	wifi_list=$(echo "$wifi_list" | grep -v "$connected_network")

	# Add the connected network to the top of the list
	wifi_list=$(printf "%s%s\n%s" \
		"$connected_network" "$CONNECTED_SYMBOL" "$wifi_list")
fi

# Get whether we are connected to a wifi network
connected_to_wifi=$(nmcli -fields WIFI g)

# Initialise the wifi toggle option
wifi_toggle_option=

# Match on the output and set the toggle option accordingly
case $connected_to_wifi in
*enabled*)
	wifi_toggle_option=$DISABLE_WIFI_OPTION
	;;
*disabled*)
	wifi_toggle_option=$ENABLE_WIFI_OPTION
	;;
esac

# Use rofi to select the wifi network
#
# The "-p" flag is to the prompt,
# and the selected row is to select the second option,
# which is a wifi network, instead of the wifi toggle option by default
chosen_network=$(printf "%s\n%s" "$wifi_toggle_option" "$wifi_list" | uniq |
	rofi -dmenu -i -selected-row 1 -p "Wi-Fi SSID")

# Get the ID of the selected network, remove the symbols and trim whitespaces
chosen_id=$(echo "$chosen_network" | cut -c 4- |
	sed "s/$CONNECTED_SYMBOL//" | awk '{$1=$1;print}')

# If the chosen network is empty then exit
if [ "$chosen_network" = "" ]; then
	exit

# Otherwise, if the enable wifi option is selected, turn on the wifi and exit
elif [ "$chosen_network" = "$ENABLE_WIFI_OPTION" ]; then
	nmcli radio wifi on
	exit

# Otherwise, if the disable wifi option is selected, turn off the wifi and exit
elif [ "$chosen_network" = "$DISABLE_WIFI_OPTION" ]; then
	nmcli radio wifi off
	exit
fi

# Message to show when the connection succeeds
success_message="Connected to the Wi-Fi network: $chosen_id"

# Get the saved connections
saved_connections=$(nmcli -g NAME connection)

# Get if the connection is saved
is_saved=$(echo "$saved_connections" | grep -w "$chosen_id")

# Initialise the connection successful variable
connection_successful=

# Initialise the variable to store whether the wifi has been connected to before
connected_before=

# If the connection is saved
if [ -n "$is_saved" ]; then

	# Get whether the connection succeeds
	connection_successful=$(nmcli connection up id "$chosen_id" |
		grep "successfully")

	# Set the connected before variable to true
	connected_before=true
fi

# Initialise the counter variable
i=0

# Iterate until the maximum retry count
while [ $i -lt $MAX_RETRY_COUNT ]; do

	# If the connection is successful
	if [ -n "$connection_successful" ]; then

		# Send the success notification
		notify-send "$success_message"

		# Exit the script
		exit
	fi

	# Otherwise, get the wifi password
	wifi_password=$(rofi -dmenu -password -p "Password for $chosen_id")

	# If the wifi password is empty, exit the script
	if [ -z "$wifi_password" ]; then
		exit
	fi

	# Send a notification to let the user know the script
	# is trying to connect to the network
	notify-send -u low "Attempting to connect to the Wi-Fi network: $chosen_id"

	# If the wifi network has been connected to before,
	# delete the connection before trying to connect again
	#
	# For some reason, network manager just can't edit an existing connection
	if [ "$connected_before" = true ]; then
		nmcli connection delete "$chosen_id"
	fi

	# Get whether the connection is successful
	connection_successful=$(nmcli device wifi connect "$chosen_id" \
		password "$wifi_password" | grep "successfully")

	# Set the connected before variable to true
	connected_before=true

	# Increment the counter
	i=$((i + 1))
done

# If the connection is successful, send the success notification
if [ -n "$connection_successful" ]; then
	notify-send "$success_message"
else
	notify-send "Failed to connect to the Wi-Fi network: $chosen_id" \
		"Please try again."
fi
