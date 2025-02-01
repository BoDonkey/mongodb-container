#!/bin/bash

# Ensure script runs inside WSL2, Linux, or macOS
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    echo "Error: This script must be run inside WSL2 or a Linux/macOS terminal."
    exit 1
fi

echo "⚠️ WARNING: This will DELETE all MongoDB data and restart the database."
read -p "Are you sure you want to reset the database? (y/N) " -n 1 -r
echo    # New line

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ Database reset aborted."
    exit 1
fi

echo "Resetting MongoDB container and data..."

if command -v docker &> /dev/null; then
    if docker ps -a | grep -q apostrophe-mongodb; then
        docker compose down -v
        docker compose up -d
        echo "✅ MongoDB has been reset and restarted."
    else
        echo "⚠️ No MongoDB container found. Starting fresh..."
        docker compose up -d
    fi
elif command -v podman &> /dev/null; then
    if podman ps -a | grep -q apostrophe-mongodb; then
        podman compose down -v
        podman compose up -d
        echo "✅ MongoDB has been reset and restarted."
    else
        echo "⚠️ No MongoDB container found. Starting fresh..."
        podman compose up -d
    fi
else
    echo "Error: Neither Docker nor Podman found"
    exit 1
fi
