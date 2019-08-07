#!/bin/bash
id="winetree94"
repository="ubuntu-android-builder"

docker build -t "${id}/${repository}:base" .
docker push "${id}/${repository}:base" .

for directory in */; do
  tag="${directory%/}"
  docker build -t "${id}/${repository}:${tag}" ${tag}/.
  docker push "${id}/${repository}:${tag}"
done