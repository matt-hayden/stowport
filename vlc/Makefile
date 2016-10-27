#! /usr/bin/make -f
STOWDEST ?= /usr/local/stow/vlc

MAX_LOAD ?= $(shell echo `nproc` + 0.5 | bc)
export MULTIMAKE ?= $(MAKE) -j -l $(MAX_LOAD)


build: config
	$(MULTIMAKE) -C $@
install: build
	sudo $(MAKE) -C $^ install
	cd $(STOWDEST)/.. && sudo stow vlc

debian-dep:
	sudo apt install -y git libtool lua5.1 build-essential pkg-config autoconf libsecret-1-dev
	sudo apt build-dep -y vlc
fedora-dep:
	sudo yum -y install git libtool lua pkgconfig

SRC:
	[ -d $@ ] || git submodule add git://git.videolan.org/vlc.git $@
update: SRC
	git submodule update --init
config: SRC
	[ -d build ] || mkdir -p build
	cd build && sh ../SRC/bootstrap
	cd build && sh ../SRC/configure --prefix=$(STOWDEST) \
		--disable-nls --enable-pulse --enable-avcodec=/usr/local/stow/ffmpeg
