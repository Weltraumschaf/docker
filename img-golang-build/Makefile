include ../Makefile.variable

image_name		= golang-build
image_version	= 1.0.0

.PHONY all:
	docker image build \
		--no-cache=$(no_cache) \
		--build-arg BUILD_DATE="$(date -u +'%Y-%m-%dT%H:%M:%SZ')" \
		--build-arg BUILD_VERSION="$(image_version)" \
		--build-arg VCS_REF="$(vcs_ref)" \
		-t $(vendor_name)/$(image_name):$(image_version) .
	docker push $(vendor_name)/$(image_name):$(image_version)

.PHONY clair:
	clair-in-a-box $(vendor_name)/$(image_name):$(image_version)