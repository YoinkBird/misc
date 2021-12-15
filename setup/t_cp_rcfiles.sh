#!/usr/bin/env bash
set -x
echo "INFO: in the following shell, manually verify the scripts"
docker run --rm -it --entrypoint bash -v $PWD:/misc:ro -w /misc ubuntu:latest
# doesn't work as of yet
#docker run --rm -it --entrypoint bash -v $PWD:/misc:ro -v $HOME:/root:ro -w /misc ubuntu:latest
