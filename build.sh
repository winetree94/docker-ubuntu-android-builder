#!/bin/bash
id="winetree94"
repository="ubuntu-android-builder"

docker build -t "${id}/${repository}:base" . --rm

for directory in */; do
  tag="${directory%/}"
  docker build -t "${id}/${repository}:${tag}" ${tag}/. --rm
done