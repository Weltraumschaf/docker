FROM openjdk:8
LABEL maintainer="ich@weltraumschaf.de"

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        maven \
        git && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://github.com/Weltraumschaf/organization.git && \
    cd organization && \
    mvn clean install
