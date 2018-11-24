#!/bin/sh

docker image build  -t weltraumschaf/debian-in-a-nutshell:1.0.0 .
docker push weltraumschaf/debian-in-a-nutshell:1.0.0
