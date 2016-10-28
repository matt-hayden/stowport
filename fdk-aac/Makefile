#! /usr/bin/make -f
STOWDEST ?= /usr/local/stow/vlc-deps

MAX_LOAD ?= $(shell echo `nproc` + 0.5 | bc)
export MULTIMAKE ?= $(MAKE) -j -l $(MAX_LOAD)


build: config
	$(MULTIMAKE) -C $@
install: build
	[ -d /usr/local/lib/pkgconfig ]
	! [ -L /usr/local/lib/pkgconfig ]
	$(MAKE) -C $^ install
	cd $(STOWDEST)/.. && sudo stow vlc-deps && sudo ldconfig


debian-dep:
	sudo apt build-dep -y libfdk-aac0


SRC:
	[ -d $@ ] || git submodule add -b master git://github.com/mstorsjo/fdk-aac.git $@
update: SRC
	git submodule update --init
	cd SRC && ./autogen.sh --prefix=$(STOWDEST)
config: SRC
	[ -d build ] || mkdir -p build
	cd build && bash ../SRC/configure --prefix=$(STOWDEST)
