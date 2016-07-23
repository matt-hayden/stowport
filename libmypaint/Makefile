#! /usr/bin/make -f
STOWDEST ?= /usr/local/stow/gimp-2.9

MAX_LOAD ?= $(shell echo `nproc` + 0.5 | bc)
export MULTIMAKE ?= $(MAKE) -j -l $(MAX_LOAD)


export ACLOCAL_FLAGS ?= -I /usr/local/share/aclocal
export PKG_CONFIG_PATH ?= /usr/local/lib/pkgconfig


install: build
	$(MAKE) -C build install
	cd $(STOWDEST)/.. && sudo stow gimp-2.9 && sudo ldconfig


debian-dep:
	sudo apt-get install -y libjson-c-dev # scons

fedora-dep:
	sudo dnf install -y json-c-devel # scons


SRC:
	git submodule add git@github.com:mypaint/libmypaint.git $@
update: SRC
	git submodule update --init
config: SRC
	[ -d build ] || mkdir -p build
	cd build && sh ../SRC/autogen.sh --prefix=$(STOWDEST)
	cd build && sh ../SRC/configure --prefix=$(STOWDEST)
build: config
	$(MULTIMAKE) -C $@
