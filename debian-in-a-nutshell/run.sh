#!/usr/bin/env bash

docker image build  -t weltraumschaf.de/debian-in-a-nutshell:1.0.0 .
docker run --rm -it -v ${HOME}/Downloads:/root/host weltraumschaf.de/debian-in-a-nutshell:1.0.0 /bin/bash
