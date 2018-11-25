FROM debian:stretch
LABEL maintainer="ich@weltraumschaf.de"

ARG BUILD_DATE
ARG VCS_REF
ARG BUILD_VERSION

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="weltraumschaf/debian-in-a-nutshe"
LABEL org.label-schema.description="Custom Debian Linux image."
LABEL org.label-schema.url="http://www.weltraumschaf.de/"
LABEL org.label-schema.vcs-url="https://github.com/Weltraumschaf/docker/tree/master/img-debian-in-a-nutshell"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vendor="Weltraumschaf"
LABEL org.label-schema.version=$BUILD_VERSION
LABEL org.label-schema.docker.cmd="docker run --rm -it -v ./my-dir:/root/host weltraumschaf/debian-in-a-nutshell:$BUILD_VERSION /bin/bash"

RUN apt-get update && \
    apt-get install -y \
        locales \
        git \
        tmux \
        apt-file \
        build-essential && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

RUN mkdir /root/src && \
    mkdir /root/bin && \
    mkdir /root/host && \
    cd /root/src && \
    git clone https://github.com/Weltraumschaf/dotfiles.git && \
    git clone https://github.com/Weltraumschaf/shell-scripts.git && \
    cd /root/src/dotfiles && ./install.sh && \
    cd /root/src/shell-scripts && ./install.sh

VOLUME /root/host
