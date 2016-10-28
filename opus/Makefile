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
	[ -d $@ ] || git submodule add https://git.xiph.org/opus.git $@
update: SRC
	git submodule update --init
config: SRC
	[ -d build ] || mkdir -p build
	cd build && sh ../SRC/autogen.sh --prefix=$(STOWDEST)
	cd build && bash ../SRC/configure --prefix=$(STOWDEST) \
		--enable-float-approx --enable-fuzzing --enable-intrensics
