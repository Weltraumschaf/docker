# My Docker Stuff

In this repo is my public Docker stuff.

* [Label Schema](http://label-schema.org/rc1/)

## Some Ready to Use Boxes

### PHP

- <https://hub.docker.com/_/php>

```bash
docker run -d -p 80:80 -v "$PWD":/var/www/html php:7.2-apache
```

## Set Up Docker Machine

A Docker Machine with VirtualBox driver has the advantage that I can ssh into the VM and then use `nsenter` to debug the containers.

### Prerequisits

```bash
brew install docker docker-compose docker-machine
```

### Setup Docker Machine

Create & verify:

```bash
docker-machine create --driver virtualbox default
docker-machine ls
```

Use the machine in current shell:

```bash
eval "$(docker-machine env default)"
```

