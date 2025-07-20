#!/usr/bin/env bash

declare -A images
images["devbox"]="Containerfile.devbox"
# images["devbox-nvidia"]="Containerfile.nvidia.devbox"

if command -v docker &>/dev/null; then
	RUNTIME="docker"
elif command -v podman &>/dev/null; then
	RUNTIME="podman"
else
	echo "Error: 'docker' or 'podman' not found in PATH!"
	exit 1
fi

for image in "${!images[@]}"; do
	"$RUNTIME" build -t "$image":latest -f "${images[$image]}"
done
