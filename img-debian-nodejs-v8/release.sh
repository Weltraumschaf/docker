#!/bin/sh

set -eu

docker image build  -t weltraumschaf/debian-nodejs-v8:1.0.0 . && \
docker push weltraumschaf/debian-nodejs-v8:1.0.0
