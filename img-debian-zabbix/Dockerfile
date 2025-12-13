FROM weltraumschaf/debian-in-a-nutshell:2.0.0
LABEL maintainer="ich@weltraumschaf.de"

ARG BUILD_DATE
ARG VCS_REF
ARG BUILD_VERSION

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="weltraumschaf/zabbix"
LABEL org.label-schema.description="Zabbix image."
LABEL org.label-schema.url="http://www.weltraumschaf.de/"
LABEL org.label-schema.vcs-url="https://github.com/Weltraumschaf/docker/tree/master/img-zabbix"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vendor="Weltraumschaf"
LABEL org.label-schema.version=$BUILD_VERSION
LABEL org.label-schema.docker.cmd="docker run --rm -it -v ./my-dir:/root/host weltraumschaf/zabbix:$BUILD_VERSION /bin/bash"

# https://www.zabbix.com/download?zabbix=4.4&os_distribution=debian&os_version=10_buster&db=postgresql&ws=nginx
WORKDIR /root
ENV DEBIAN_FRONTEND noninteractive
RUN curl -sSLO https://repo.zabbix.com/zabbix/4.4/debian/pool/main/z/zabbix-release/zabbix-release_4.4-1+buster_all.deb && \
    dpkg -i zabbix-release_4.4-1+buster_all.deb && \
    apt-get update && \
    apt-get install -y \
        postgresql \
        nginx \
        php7.3-pgsql \
        zabbix-server-pgsql \
        zabbix-frontend-php \
        zabbix-nginx-conf \
        zabbix-agent