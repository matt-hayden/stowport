#! /usr/bin/make -f
STOWDEST ?= vlc-deps
include ../autoconf-template.mk


SRC:
	[ -d $@ ] || git submodule add -b master git://github.com/libarchive/libarchive.git $@
update: SRC
	git submodule update --init
config: SRC
	[ -d build ] || mkdir -p build
	cd build && sh ../SRC/configure --prefix=$(PREFIX)
