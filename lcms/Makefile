#! /usr/bin/make -f
STOWDEST ?= /usr/local/stow/gimp-deps


build: config
	$(MULTIMAKE) -C $@
install: build
	$(MAKE) -C $^ $@
	cd $(STOWDEST)/.. && sudo stow gimp-deps && sudo ldconfig


SRC:
	[ -d $@ ] || git submodule add -b master git://github.com/mm2/Little-CMS.git $@
update: SRC
	git submodule update --init
config: SRC # debian-dep
	[ -d build ] || mkdir -p build
	cd build && sh ../SRC/configure --prefix=$(STOWDEST)
