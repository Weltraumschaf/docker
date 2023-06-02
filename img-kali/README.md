# Kali Linux

This is a image to spin up a custom Kali Linux.

Build the image:

```bash
docker image build  -t weltraumschaf/kali:1.0.0 .
```

Run the image:

```bash
docker run -ti --rm --mount type=bind,src=${HOME}/dkali-root,dst=/root --mount src=kali-postgres,dst=/var/lib/postgresql weltraumschaf/kali:1.0.0 /bin/bash
```
