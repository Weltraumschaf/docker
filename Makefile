SUB_MODULES	= $(sort $(dir $(wildcard img-*/)))

.PHONY: all

all:
	@for directory in $(SUB_MODULES); do \
		if [ -f "$$directory/Makefile" ]; then \
			( \
				cd "$$directory" && make \
			) \
		fi \
	done

clair:
	@for directory in $(SUB_MODULES); do \
		if [ -f "$$directory/Makefile" ]; then \
			( \
				cd "$$directory" && make clair \
			) \
		fi \
	done
