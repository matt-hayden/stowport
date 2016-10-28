#! /usr/bin/make -f
STOWDEST ?= /usr/local/stow/gimp-2.9

MAX_LOAD ?= $(shell echo `nproc` + 0.5 | bc)
export MULTIMAKE ?= $(MAKE) -j -l $(MAX_LOAD)


export ACLOCAL_FLAGS ?= -I /usr/local/share/aclocal
export PKG_CONFIG_PATH ?= /usr/local/lib/pkgconfig


build: config
	$(MULTIMAKE) -C $@
install: build
	[ -d /usr/local/lib/pkgconfig ]
	! [ -L /usr/local/lib/pkgconfig ]
	$(MAKE) -C $^ $@
	cd $(STOWDEST)/.. && sudo stow --ignore='[.]cache$$' gimp-2.9 && sudo ldconfig


debian-dep:
	sudo apt-get install -y libglib2.0-dev libjson-c-dev intltool # scons

fedora-dep:
	sudo dnf install -y json-c-devel # scons


SRC:
	git submodule add -b master git://github.com/mypaint/libmypaint.git $@
update: SRC
	git submodule update --init
config: SRC
	[ -d build ] || mkdir -p build
	cd build && sh ../SRC/autogen.sh --prefix=$(STOWDEST)
	cd build && sh ../SRC/configure --prefix=$(STOWDEST)
