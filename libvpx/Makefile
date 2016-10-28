#! /usr/bin/make -f
STOWDEST ?= /usr/local/stow/ffmpeg

MAX_LOAD ?= $(shell echo `nproc` + 0.5 | bc)
export MULTIMAKE ?= $(MAKE) -j -l $(MAX_LOAD)


CFLAGS=-fpic

build: config
	$(MULTIMAKE) -C $@
install: build
	[ -d /usr/local/lib/pkgconfig ]
	! [ -L /usr/local/lib/pkgconfig ]
	$(MAKE) -C $^ install
	cd $(STOWDEST)/.. && sudo stow ffmpeg && sudo ldconfig


debian-dep:
	sudo apt -y install yasm


SRC:
	[ -d $@ ] || git submodule add https://chromium.googlesource.com/webm/libvpx $@
update: SRC
	git submodule update --init
config: SRC
	[ -d build ] || mkdir -p build
	cd build && sh ../SRC/configure --prefix=$(STOWDEST) \
		--disable-examples --disable-docs \
		--enable-vp9-postproc --as=yasm \
		--enable-runtime-cpu-detect --enable-shared --enable-postproc-visualizer \
		--enable-multi-res-encoding --enable-vp9-temporal-denoising --enable-webm-io
