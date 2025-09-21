#!/bin/bash

# Check if VPN is active (assumes Proton VPN connection name contains "proton" or similar)
vpn_status=$(nmcli -t -f NAME,TYPE con show --active | grep -i vpn | cut -d: -f1)

if [ -n "$vpn_status" ]; then
    # Optional: Get server or IP (modify based on your .ovpn name or nmcli output)
    vpn_name=$(echo "$vpn_status" | head -n 1)
    echo "{\"text\": \"VPN \", \"class\": \"vpn-on\", \"tooltip\": \"VPN Active: $vpn_name\"}"
else
    echo "{\"text\": \"VPN \", \"class\": \"vpn-off\", \"tooltip\": \"VPN Disconnected\"}"
fi
