#! /usr/bin/make -f
STOWDEST ?= protobuf
include ../autoconf.template


SRC:
	[ -d $@ ] || git submodule add -b master git://github.com/google/protobuf $@
	cd $@ && ./autogen.sh --prefix=$(PREFIX)
update: SRC
	git submodule update --init
	cd $^ && ./autogen.sh --prefix=$(PREFIX)
config: SRC
	[ -d build ] || mkdir -p build
	cd build && sh ../SRC/configure --prefix=$(STOWDEST)
