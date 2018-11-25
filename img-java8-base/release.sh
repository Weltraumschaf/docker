#!/bin/sh

set -eu

docker image build \
    --no-cache=true \
    --build-arg \
    BUILD_DATE="$(date -u +'%Y-%m-%dT%H:%M:%SZ')" \
    -t weltraumschaf/java8-base:1.0.0 . && \
docker push weltraumschaf/java8-base:1.0.0
