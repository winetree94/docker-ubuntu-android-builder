#!/bin/bash
id="winetree94"
repository="ubuntu-android-builder"

docker build -t "${id}/${repository}" . --rm -q

for directory in */; do
  tag="${directory%/}"
  docker build -t "${id}/${repository}:${tag}" ${tag}/. --rm -q
done