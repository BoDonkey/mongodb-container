#!/bin/bash

if command -v docker &> /dev/null; then
    docker compose up -d
elif command -v podman &> /dev/null; then
    podman compose up -d
else
    echo "Error: Neither Docker nor Podman found"
    exit 1
fi

# Windows WSL2 specific: Check if running in WSL and set up port forwarding if needed
if [ -f /proc/version ] && grep -q microsoft /proc/version 2>/dev/null; then
    if ! netsh.exe interface portproxy show v4tov4 | grep -q "27017"; then
        echo "Setting up Windows port forwarding..."
        powershell.exe -Command "Start-Process netsh -ArgumentList 'interface portproxy add v4tov4 listenport=27017 connectaddress=localhost connectport=27017' -Verb RunAs"
    fi
fi