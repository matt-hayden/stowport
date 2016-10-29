#! /usr/bin/make -f
STOWDEST ?= vlc-deps
include ../autoconf-template.mk


SRC:
	[ -d $@ ] || git submodule add -b master git://git.videolan.org/x264 $@
update: SRC
	git submodule update --init
config: SRC
	[ -d build ] || mkdir -p build
	cd build && bash ../SRC/configure --prefix=$(PREFIX) \
		--enable-shared --enable-pic
