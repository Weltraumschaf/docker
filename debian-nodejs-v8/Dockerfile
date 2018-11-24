FROM weltraumschaf/debian-in-a-nutshell:1.0.0

# https://github.com/nodesource/distributions/blob/master/README.md#debinstall
RUN apt-get update && \
    apt-get install -y gnupg2 curl && \
    curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -y nodejs
