#!/usr/bin/env bash

mkdir -p wheels

docker build -t tensorflow-builder -f Dockerfile .
docker run --rm -it --mount type=bind,source="$(pwd)"/wheels,target=/host_wheels tensorflow-builder bash -c "cp /wheels/* /host_wheels/"


echo "\nYour Tensorflow package should now be in the 'wheels' directory."
ls -l wheels
