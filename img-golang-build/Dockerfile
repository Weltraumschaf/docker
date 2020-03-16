# Image for GitLab CI to provide necessary tools such as Clang/LLVM and golint
FROM golang:1.14-buster

LABEL maintainer="ich@weltraumschaf.de"

ARG BUILD_DATE
ARG VCS_REF
ARG BUILD_VERSION

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="weltraumschaf/golang-build"
LABEL org.label-schema.description="Custom Golang build image."
LABEL org.label-schema.url="http://www.weltraumschaf.de/"
LABEL org.label-schema.vcs-url="https://github.com/Weltraumschaf/docker/tree/master/img-debian-golang-build"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vendor="Weltraumschaf"
LABEL org.label-schema.version=$BUILD_VERSION
LABEL org.label-schema.docker.cmd="docker run --rm -it weltraumschaf/debian-in-a-nutshell:$BUILD_VERSION /bin/bash"

ENV GOPATH /go
ENV PATH ${GOPATH}/bin:$PATH
ENV DEBIAN_FRONTEND noninteractive

RUN go get -u golang.org/x/lint/golint

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        clang-6.0 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV SET_CLANG /etc/profile.d/set-clang-cc.sh
RUN echo "export CC=clang-6.0" | tee -a ${SET_CLANG} && chmod a+x ${SET_CLANG}

