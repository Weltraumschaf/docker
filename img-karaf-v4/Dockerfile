FROM weltraumschaf/debian-in-a-nutshell:1.0.0 AS karaf-intsall

WORKDIR /tmp/karaf-dist
COPY download-karaf.sh .
RUN ./download-karaf.sh

FROM weltraumschaf:java8-base:1.0.0

ARG BUILD_DATE
ARG VCS_REF
ARG BUILD_VERSION

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="weltraumschaf/karaf-v4"
LABEL org.label-schema.description="A Debian Linux based imge with Java 8 and Apache Karaf installed."
LABEL org.label-schema.url="http://www.weltraumschaf.de/"
LABEL org.label-schema.vcs-url="https://github.com/Weltraumschaf/docker/tree/master/img-karaf-v4"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vendor="Weltraumschaf"
LABEL org.label-schema.version=$BUILD_VERSION
LABEL org.label-schema.docker.cmd="docker run --rm -it weltraumschaf/karaf-v4:$BUILD_VERSION"

ENV KARAF_INSTALLATION_DIR /opt
ENV KARAF_HOME $KARAF_INSTALLATION_DIR/apache-karaf
ENV KARAF_DEPLOY_DIR $KARAF_HOME/deploy
ENV PATH $PATH:$KARAF_HOME/bin

COPY --from=karaf-intsall \
    /tmp/karaf-dist/apache-karaf-* \
    $KARAF_HOME/

WORKDIR $KARAF_HOME

VOLUME ["$KARAF_DEPLOY_DIR"]

# The Karaf WebContainer
EXPOSE 8181
# The Karaf SSH server: ssh -p 8101 karaf@localhost
EXPOSE 8101
# The Karaf JMX MBean server
EXPOSE 1099 44444

CMD ["karaf"]
