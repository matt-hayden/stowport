#! /usr/bin/make -f
STOWDEST ?= /usr/local/stow/libsodium

MAX_LOAD ?= $(shell echo `nproc` + 0.5 | bc)
export MULTIMAKE ?= $(MAKE) -j -l $(MAX_LOAD)


build: config
	$(MULTIMAKE) -C $@ check
install: build
	$(MAKE) -C build install
	cd $(STOWDEST)/.. && sudo stow libsodium && sudo ldconfig


SRC:
	[ -d $@ ] || git submodule add -b master git://github.com/jedisct1/libsodium.git $@
update: SRC
	git submodule update --init
config: SRC
	cd SRC && sh autogen.sh --prefix=$(STOWDEST)
	[ -d build ] || mkdir -p build
	cd build && sh ../SRC/configure --prefix=$(STOWDEST)
