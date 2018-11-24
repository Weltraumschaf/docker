FROM openjdk:8

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        maven \
        git
RUN git clone https://github.com/Weltraumschaf/organization.git && \
    cd organization && \
    mvn clean install
