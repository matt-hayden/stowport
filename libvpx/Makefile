#! /usr/bin/make -f
STOWDEST ?= vpx
CFLAGS=-fpic
include ../autoconf-template.mk


debian-dep:
	sudo apt -y install yasm


SRC:
	[ -d $@ ] || git submodule add -b master https://chromium.googlesource.com/webm/libvpx $@
update: SRC
	git submodule update --init
config: SRC
	[ -d build ] || mkdir -p build
	cd build && sh ../SRC/configure --prefix=$(PREFIX) \
		--disable-examples --disable-docs \
		--enable-vp9-postproc --as=yasm \
		--enable-runtime-cpu-detect --enable-shared --enable-postproc-visualizer \
		--enable-multi-res-encoding --enable-vp9-temporal-denoising --enable-webm-io
