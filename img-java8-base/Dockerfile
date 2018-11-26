FROM openjdk:8
LABEL maintainer="ich@weltraumschaf.de"

ARG BUILD_DATE
ARG VCS_REF
ARG BUILD_VERSION

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="weltraumschaf/java8-base"
LABEL org.label-schema.description="A Debian Linux based imge with Git & Maven and my organization POM installed."
LABEL org.label-schema.url="http://www.weltraumschaf.de/"
LABEL org.label-schema.vcs-url="https://github.com/Weltraumschaf/docker/tree/master/img-debian-nodejs-v8"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vendor="Weltraumschaf"
LABEL org.label-schema.version=$BUILD_VERSION
LABEL org.label-schema.docker.cmd="docker run --rm -it weltraumschaf/java8-base:1.0.0 /bin/bash"

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        maven \
        git && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://github.com/Weltraumschaf/organization.git && \
    cd organization && \
    mvn clean install
