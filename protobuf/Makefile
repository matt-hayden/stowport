#! /usr/bin/make -f
STOWDEST ?= /usr/local/stow/vlc

MAX_LOAD ?= $(shell echo `nproc` + 0.5 | bc)
export MULTIMAKE ?= $(MAKE) -j -l $(MAX_LOAD)


build: config
	$(MULTIMAKE) -C $@
install: build
	[ -d /usr/local/lib/pkgconfig ]
	! [ -L /usr/local/lib/pkgconfig ]
	$(MAKE) -C $^ install
	cd $(STOWDEST)/.. && sudo stow vlc && sudo ldconfig


debian-dep:
	#sudo apt build-dep -y libfdk-aac0


SRC:
	[ -d $@ ] || git submodule add git://github.com/google/protobuf $@
update: SRC
	git submodule update --init
config: SRC
	[ -d build ] || mkdir -p build
	cd SRC && ./autogen.sh --prefix=$(STOWDEST)
	cd build && sh ../SRC/configure --prefix=$(STOWDEST)
