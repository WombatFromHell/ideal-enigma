#!/usr/bin/env bash

IMAGE_NAME="devbox:latest"
docker build -t $IMAGE_NAME -f Containerfile.devbox
