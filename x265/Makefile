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

debian-dep:
	sudo apt -y install cmake mercurial yasm


SRC:
	[ -d $@ ] || hg clone https://bitbucket.org/multicoreware/x265 $@
update: SRC
	cd $^ && hg pull -u
config: SRC
	[ -d build ] || mkdir -p build
	cd build && cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=$(STOWDEST) ../SRC/source
