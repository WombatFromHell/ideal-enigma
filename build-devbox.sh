#!/usr/bin/env bash

IMAGE_NAME="devbox:latest"

if command -v docker &>/dev/null; then
	RUNTIME="docker"
elif command -v podman &>/dev/null; then
	RUNTIME="podman"
else
	echo "Error: 'docker' or 'podman' not found in PATH!"
	exit 1
fi

"$RUNTIME" build -t $IMAGE_NAME -f Containerfile.devbox
