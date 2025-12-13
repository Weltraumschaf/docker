# Debian in a Nutshell

This is an image to spin up a custom Debian with Java 8, Maven and my organizational POM installed, if I need a Java to play around.

Build the image:

```bash
docker image build  -t weltraumschaf/java8-base:1.0.0 .
```

Run the image:

```bash
docker run --rm -it weltraumschaf/java8-base:1.0.0 /bin/bash
```
