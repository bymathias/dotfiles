#!/bin/bash

entries="Logout\nSuspend\nReboot\nShutdown"
selected=$(echo -e "$entries" | rofi -dmenu -p "Power Menu" | awk '{print tolower($1)}')

case $selected in
    logout)
        swaymsg exit;;
    suspend)
        systemctl suspend;;
    reboot)
        systemctl reboot;;
    shutdown)
        systemctl poweroff;;
esac
