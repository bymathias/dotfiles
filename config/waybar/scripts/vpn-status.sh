#!/bin/bash

vpn_status=$(nmcli -t -f NAME,TYPE con show --active | grep -i vpn | cut -d: -f1)

if [ -n "$vpn_status" ]; then
    vpn_name=$(echo "$vpn_status" | head -n 1)
    echo "{\"text\": \"󰒍\", \"class\": \"vpn-on\", \"tooltip\": \"VPN: $vpn_name\"}"
else
    echo "{\"text\": \"󰦞\", \"class\": \"vpn-off\", \"tooltip\": \"VPN disconnected\"}"
fi
