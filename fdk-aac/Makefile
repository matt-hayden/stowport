#! /usr/bin/make -f
STOWDEST ?= ffmpeg-deps
include ../autoconf-template.mk


debian-dep:
	sudo apt build-dep -y libfdk-aac0


SRC:
	[ -d $@ ] || git submodule add -b master git://github.com/mstorsjo/fdk-aac.git $@
update: SRC
	git submodule update --init
	cd SRC && ./autogen.sh --prefix=$(PREFIX)
config: SRC
	[ -d build ] || mkdir -p build
	cd build && bash ../SRC/configure --prefix=$(PREFIX) \
		--disable-static
