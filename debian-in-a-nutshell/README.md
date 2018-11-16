# Debian in a Nutshell

This is a image to spin up a custom Debian, if I need a Debian shell to play around.

Build the image:

```bash
docker image build  -t weltraumschaf/debian-in-a-nutshell:1.0.0 .
```

Run the image:

```bash
docker run --rm -it -v ${HOME}/Downloads:/root/host debian-in-a-nutshell:1.0.0 /bin/bash
```
