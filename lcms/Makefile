#! /usr/bin/make -f
STOWDEST ?= /usr/local/stow/gimp-2.9


build: config
	$(MULTIMAKE) -C $@
install: build
	$(MAKE) -C build install
	cd $(STOWDEST)/.. && sudo stow gimp-2.9 && sudo ldconfig


SRC:
	[ -d $@ ] || git submodule add git://github.com/mm2/Little-CMS.git $@
update: SRC
	git submodule update --init
config: SRC # debian-dep
	[ -d build ] || mkdir -p build
	cd build && sh ../SRC/autogen.sh --prefix=$(STOWDEST)
	cd build && sh ../SRC/configure --prefix=$(STOWDEST)
