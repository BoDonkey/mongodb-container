#!/bin/bash

# Ensure script runs inside WSL2, Linux, or macOS
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    echo "Error: This script must be run inside WSL2 or a Linux/macOS terminal."
    exit 1
fi

echo "Stopping MongoDB container..."

if command -v docker &> /dev/null; then
    if docker ps | grep -q apostrophe-mongodb; then
        docker compose down
        echo "✅ MongoDB container stopped."
    else
        echo "⚠️ No running MongoDB container found."
    fi
elif command -v podman &> /dev/null; then
    if podman ps | grep -q apostrophe-mongodb; then
        podman compose down
        echo "✅ MongoDB container stopped."
    else
        echo "⚠️ No running MongoDB container found."
    fi
else
    echo "Error: Neither Docker nor Podman found"
    exit 1
fi
