FROM local/debian-in-a-nutshell

# https://github.com/nodesource/distributions/blob/master/README.md#debinstall
RUN apt-get update && \
    apt-get install -y gpg2 curl && \
    curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -y nodejs
