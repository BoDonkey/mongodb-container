#!/bin/bash

# Detect if running inside WSL2
if [ -f /proc/version ] && grep -q microsoft /proc/version 2>/dev/null; then
    echo "Detected WSL2 environment."
else
    echo "Error: This script is intended to run inside WSL2."
    exit 1
fi

# Check for Docker or Podman
if command -v docker &> /dev/null; then
    echo "Starting MongoDB with Docker..."
    docker compose up -d
elif command -v podman &> /dev/null; then
    echo "Starting MongoDB with Podman..."
    podman compose up -d
else
    echo "Error: Neither Docker nor Podman found. Please install one."
    exit 1
fi

# Windows WSL2 specific: Check and set up port forwarding
if netsh.exe interface portproxy show v4tov4 | grep -q "27017"; then
    echo "Port forwarding for MongoDB already set up."
else
    echo "Setting up Windows port forwarding..."
    powershell.exe -Command "Start-Process netsh -ArgumentList 'interface portproxy add v4tov4 listenport=27017 connectaddress=localhost connectport=27017' -Verb RunAs"
fi

echo "MongoDB should now be running at mongodb://localhost:27017"
