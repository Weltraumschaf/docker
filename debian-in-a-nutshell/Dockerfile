FROM debian:stretch

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
