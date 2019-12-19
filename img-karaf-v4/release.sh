#!/bin/sh

set -eu

BUILD_VERSION="1.0.0"

docker image build \
    --no-cache=true \
    --build-arg BUILD_DATE="$(date -u +'%Y-%m-%dT%H:%M:%SZ')" \
    --build-arg BUILD_VERSION="${BUILD_VERSION}" \
    --build-arg VCS_REF="$(git rev-parse --short HEAD)" \
    -t weltraumschaf/karaf-v4:$BUILD_VERSION . && \
docker push weltraumschaf/karaf-v4:$BUILD_VERSION
