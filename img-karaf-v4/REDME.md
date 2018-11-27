# Karaf 4 Image

This image provides a preinstalled Karaf 4 distribution.

```bash
docker run --rm -it weltraumschaf/karaf-v4:1.0.0
```

Or with deployment volume:

```bash
docker run --rm -it \
    -v deploy:/opt/apache-karaf/deploy \
    -p 8101:8101 \
    -p 8181:8181 \
    weltraumschaf/karaf-v4:1.0.0
```
