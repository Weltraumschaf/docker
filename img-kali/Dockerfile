# https://medium.com/@airman604/kali-linux-in-a-docker-container-5a06311624eb
FROM kalilinux/kali-linux-docker:latest
LABEL maintainer="ich@weltraumschaf.de"

ARG BUILD_DATE
ARG VCS_REF
ARG BUILD_VERSION

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="weltraumschaf/kali"
LABEL org.label-schema.description="Custom Kali Linux image."
LABEL org.label-schema.url="http://www.weltraumschaf.de/"
LABEL org.label-schema.vcs-url="https://github.com/Weltraumschaf/docker/tree/master/img-kali"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vendor="Weltraumschaf"
LABEL org.label-schema.version=$BUILD_VERSION
LABEL org.label-schema.docker.cmd="docker run -ti --rm --mount type=bind,src=${HOME}/dkali-root,dst=/root --mount src=kali-postgres,dst=/var/lib/postgresql weltraumschaf/kali:1.0.0 /bin/bash"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get dist-upgrade -y && \
    apt-get autoremove -y && \
    apt-get clean -y && \
    apt-get install -y \
        kali-linux-top10 \
        man-db \
        exploitdb \
        tmux \
        apt-file

WORKDIR /root

RUN mkdir -p /root/src /root/bin /root/host
RUN cd /root/src && \
    git clone https://github.com/Weltraumschaf/dotfiles.git && \
    cd dotfiles && \
    ./install.sh && \
    cd
RUN cd /root/src && \
    git clone https://github.com/Weltraumschaf/shell-scripts.git && \
    cd shell-scripts && \
    ./install.sh && \
    cd

