#! /usr/bin/make -f
STOWDEST ?= /usr/local/stow/vlc-deps

MAX_LOAD ?= $(shell echo `nproc` + 0.5 | bc)
export MULTIMAKE ?= $(MAKE) -j -l $(MAX_LOAD)


build: config
	$(MULTIMAKE) -C $@
install: build
	[ -d /usr/local/lib/pkgconfig ]
	! [ -L /usr/local/lib/pkgconfig ]
	$(MAKE) -C $^ $@
	cd $(STOWDEST)/.. && sudo stow vlc-deps && sudo ldconfig


SRC:
	[ -d $@ ] || git submodule add -b master https://git.xiph.org/opus.git $@
	sh SRC/autogen.sh --prefix=$(STOWDEST)
update: SRC
	git submodule update --init
	sh SRC/autogen.sh --prefix=$(STOWDEST)
config: SRC
	[ -d build ] || mkdir -p build
	cd build && bash ../SRC/configure --prefix=$(STOWDEST) \
		--enable-float-approx --enable-fuzzing --enable-intrensics
