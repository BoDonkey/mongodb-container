#!/bin/bash
if command -v docker &> /dev/null; then
    docker compose down
elif command -v podman &> /dev/null; then
    podman compose down
else
    echo "Error: Neither Docker nor Podman found"
    exit 1
fi