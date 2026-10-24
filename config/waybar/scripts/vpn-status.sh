#!/bin/bash

# Check Mullvad first
if command -v mullvad &>/dev/null; then
    status=$(mullvad status 2>/dev/null)
    if echo "$status" | grep -q "^Connected"; then
        relay=$(echo "$status" | grep -oP 'Relay:\s+\K\S+')
        location=$(echo "$status" | grep -oP 'Visible location:\s+\K[^\n]+' | sed 's/\. IPv4:.*//')
        tooltip="Mullvad: ${relay}${location:+ — $location}"
        echo "{\"text\": \"󰒍\", \"class\": \"vpn-on\", \"tooltip\": \"$tooltip\"}"
        exit 0
    fi
fi

# Fall back to nmcli
vpn_status=$(nmcli -t -f NAME,TYPE con show --active 2>/dev/null | grep -i vpn | cut -d: -f1)

if [ -n "$vpn_status" ]; then
    vpn_name=$(echo "$vpn_status" | head -n 1)
    echo "{\"text\": \"󰒍\", \"class\": \"vpn-on\", \"tooltip\": \"VPN: $vpn_name\"}"
else
    echo "{\"text\": \"󰦞\", \"class\": \"vpn-off\", \"tooltip\": \"VPN disconnected\"}"
fi
