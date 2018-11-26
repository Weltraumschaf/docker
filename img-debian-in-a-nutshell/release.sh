#!/bin/sh

set -eu

BUILD_VERSION="1.0.0"

docker image build \
    --no-cache=true \
    --build-arg \
    BUILD_DATE="$(date -u +'%Y-%m-%dT%H:%M:%SZ')" \
    -t weltraumschaf/debian-in-a-nutshell:$BUILD_VERSION . && \
docker push weltraumschaf/debian-in-a-nutshell:$BUILD_VERSION
