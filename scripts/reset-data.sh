#!/bin/bash
if command -v docker &> /dev/null; then
    docker compose down -v
    docker compose up -d
elif command -v podman &> /dev/null; then
    podman-compose down -v
    podman-compose up -d
else
    echo "Error: Neither Docker nor Podman found"
    exit 1
fi