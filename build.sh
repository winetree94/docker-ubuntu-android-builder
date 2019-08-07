#!/bin/bash
id="winetree94"
repository="ubuntu-android-builder"

docker build -t "${id}/${repository}:base" .

for directory in */; do
  tag="${directory%/}"
  docker build -t "${id}/${repository}:${tag}" ${tag}/.
done