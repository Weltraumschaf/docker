FROM debian:trixie
LABEL maintainer="ich@weltraumschaf.de"

ARG BUILD_DATE
ARG VCS_REF
ARG BUILD_VERSION

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="weltraumschaf/claude-code"
LABEL org.label-schema.description="Custom Debian Linux image with Claude Code."
LABEL org.label-schema.url="http://www.weltraumschaf.de/"
LABEL org.label-schema.vcs-url="https://github.com/Weltraumschaf/docker/tree/master/img-claude-code"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vendor="Weltraumschaf"
LABEL org.label-schema.version=$BUILD_VERSION
LABEL org.label-schema.docker.cmd="docker run --rm -it -v ./my-dir:/root/host weltraumschaf/claude-code:$BUILD_VERSION /bin/bash"


ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

ENV EDITOR=nano
ENV VISUAL=nano

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y \
        locales \
        git \
        tmux \
        nano \
        curl && \
    sed -i 's/^# *en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG=en_US.utf8

RUN install -d -m 0755 /etc/apt/keyrings && \
    curl -fsSL https://downloads.claude.ai/keys/claude-code.asc \
        -o /etc/apt/keyrings/claude-code.asc && \
    echo "deb [signed-by=/etc/apt/keyrings/claude-code.asc] https://downloads.claude.ai/claude-code/apt/stable stable main" \
        > /etc/apt/sources.list.d/claude-code.list && \
    apt update && \
    apt install -y claude-code

WORKDIR /root
RUN mkdir -p src bin host
RUN cd /root/src && git clone https://github.com/Weltraumschaf/dotfiles.git && /root/src/dotfiles/bin/install.sh --non-interactive
