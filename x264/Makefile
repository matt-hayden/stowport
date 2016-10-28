#! /usr/bin/make -f
STOWDEST ?= /usr/local/stow/ffmpeg

MAX_LOAD ?= $(shell echo `nproc` + 0.5 | bc)
export MULTIMAKE ?= $(MAKE) -j -l $(MAX_LOAD)


build: config
	$(MULTIMAKE) -C $@
install: build
	[ -d /usr/local/lib/pkgconfig ]
	! [ -L /usr/local/lib/pkgconfig ]
	$(MAKE) -C $^ $@
	cd $(STOWDEST)/.. && sudo stow ffmpeg && sudo ldconfig


SRC:
	[ -d $@ ] || git submodule add git://git.videolan.org/x264 $@
update: SRC
	git submodule update --init
config: SRC
	[ -d build ] || mkdir -p build
	cd build && bash ../SRC/configure --prefix=$(STOWDEST) \
		--enable-shared --enable-pic
