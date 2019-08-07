#!/bin/bash
id="winetree94"
repository="ubuntu-android-builder"

docker push "${id}/${repository}:base"

for directory in */; do
  tag="${directory%/}"
  docker push "${id}/${repository}:${tag}"
done