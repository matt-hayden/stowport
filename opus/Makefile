#! /usr/bin/make -f
STOWDEST ?= opus
include ../autoconf-template.mk


SRC:
	[ -d $@ ] || git submodule add -b master https://git.xiph.org/opus.git $@
	sh SRC/autogen.sh --prefix=$(PREFIX)
update: SRC
	git submodule update --init
	sh SRC/autogen.sh --prefix=$(PREFIX)
config: SRC
	[ -d build ] || mkdir -p build
	cd build && bash ../SRC/configure --prefix=$(PREFIX) \
		--disable-static \
		--enable-float-approx --enable-fuzzing --enable-intrensics
