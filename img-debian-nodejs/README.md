# Debian w/ NodeJS

This is an image to spin up a custom Debian with the NodeJS shit to not clutter my real systems.

Build the image:

```bash
docker image build  -t weltraumschaf/debian-nodejs-v8:1.0.0 .
```

Rn the image:

```bash
docker run --rm -it -v ${HOME}/Downloads:/root/host weltraumschaf/debian-nodejs-v8:1.0.0 /bin/bash
```
