FROM eclipse-temurin:25-jdk
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
LABEL org.label-schema.docker.cmd="docker run --rm -it weltraumschaf/java8-base:$BUILD_VERSION /bin/bash"

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        git && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY apache-maven-3.9.11-bin.tar.gz /opt/apache-maven-3.9.11-bin.tar.gz
RUN cd /opt && \
    tar -xvzf apache-maven-3.9.11-bin.tar.gz && \
    rm apache-maven-3.9.11-bin.tar.gz && \
    echo 'export M2_HOME="/opt/apache-maven-3.9.11"' >> /root/.bashrc && \
    echo 'export PATH="${PATH}:${M2_HOME}/bin"' >> /root/.bashrc && \
    update-alternatives --install "/usr/bin/mvn" "mvn" "/opt/apache-maven-3.9.11/bin/mvn" 0 && \
    update-alternatives --set mvn /opt/apache-maven-3.9.11/bin/mvn

RUN git clone https://github.com/Weltraumschaf/organization.git && \
    cd organization && \
    mvn clean install
