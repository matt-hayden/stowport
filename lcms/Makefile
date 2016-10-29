#! /usr/bin/make -f
STOWDEST ?= gimp-deps
include ../autoconf-template.mk


SRC:
	[ -d $@ ] || git submodule add -b master git://github.com/mm2/Little-CMS.git $@
update: SRC
	git submodule update --init
config: SRC # debian-dep
	[ -d build ] || mkdir -p build
	cd build && sh ../SRC/configure --prefix=$(PREFIX) \
		--disable-static
