# Debian in a Nutshell

This is an image to spin up a custom Debian, if I need a Debian shell to play around.

Build the image:

```bash
docker image build  -t weltraumschaf/debian-in-a-nutshell:2.0.0 .
```

Run the image:

```bash
docker run --rm -it -v ${HOME}/Downloads:/root/host weltraumschaf/debian-in-a-nutshell:2.0.0 /bin/bash
```
