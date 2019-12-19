#!/bin/sh

set -eu

BUILD_VERSION="1.0.0"
NO_CACHE=${1:-"false"}

docker image build \
    --no-cache=${NO_CACHE} \
    --no-cache=true \
    --build-arg BUILD_DATE="$(date -u +'%Y-%m-%dT%H:%M:%SZ')" \
    --build-arg BUILD_VERSION="${BUILD_VERSION}" \
    --build-arg VCS_REF="$(git rev-parse --short HEAD)" \
    -t weltraumschaf/debian-nodejs-v8:$BUILD_VERSION . && \
docker push weltraumschaf/debian-nodejs-v8:$BUILD_VERSION
