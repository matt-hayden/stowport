#! /usr/bin/make -f
STOWDEST ?= /usr/local/stow/gimp-2.9

MAX_LOAD ?= $(shell echo `nproc` + 0.5 | bc)
export MULTIMAKE ?= $(MAKE) -j -l $(MAX_LOAD)


build: config
	$(MULTIMAKE) -C $@
install: build
	[ -d /usr/local/lib/pkgconfig ]
	! [ -L /usr/local/lib/pkgconfig ]
	$(MAKE) -C $^ $@
	cd $(STOWDEST)/.. && sudo stow --ignore='[.]cache$$' gimp-2.9 && sudo ldconfig


debian-dep:
	sudo apt-get install -y autoconf libtool
fedora-dep:
	sudo dnf install -y autoconf libtool


SRC:
	[ -d $@ ] || git submodule add -b master git://git.gnome.org/babl $@
update: SRC
	git submodule update --init
config: SRC debian-dep
	[ -d build ] || mkdir -p build
	cd build && sh ../SRC/autogen.sh --prefix=$(STOWDEST)
	cd build && sh ../SRC/configure --prefix=$(STOWDEST) \
		--disable-docs
