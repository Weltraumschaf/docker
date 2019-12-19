FROM weltraumschaf/debian-in-a-nutshell:1.0.0
LABEL maintainer="ich@weltraumschaf.de"

ARG BUILD_DATE
ARG VCS_REF
ARG BUILD_VERSION

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="weltraumschaf/debian-nodejs-v8"
LABEL org.label-schema.description="A Debian Linux with installed NodeJS v8."
LABEL org.label-schema.url="http://www.weltraumschaf.de/"
LABEL org.label-schema.vcs-url="https://github.com/Weltraumschaf/docker/tree/master/img-debian-nodejs-v8"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vendor="Weltraumschaf"
LABEL org.label-schema.version=$BUILD_VERSION
LABEL org.label-schema.docker.cmd="docker run --rm -it -v ./my-dir:/root/host weltraumschaf/debian-nodejs-v8:$BUILD_VERSION /bin/bash"

# https://github.com/nodesource/distributions/blob/master/README.md#debinstall
RUN apt-get update && \
    apt-get install -y gnupg2 curl && \
    curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -y nodejs npm
