#!/bin/sh

docker image build  -t weltraumschaf/java8-base:1.0.0 .
docker push weltraumschaf/java8-base:1.0.0
