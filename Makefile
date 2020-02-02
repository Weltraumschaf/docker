.PHONY: all

all:
	$(MAKE) -C img-debian-in-a-nutshell/
	# $(MAKE) -C img-debian-nodejs-antora/
	$(MAKE) -C img-debian-nodejs-v8/
	# $(MAKE) -C img-distroless-karaf-v4/
	$(MAKE) -C img-java8-base/
	$(MAKE) -C img-kali/
	$(MAKE) -C img-karaf-v4/
