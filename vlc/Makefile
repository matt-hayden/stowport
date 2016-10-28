#! /usr/bin/make -f
STOWDEST ?= /usr/local/stow/vlc

MAX_LOAD ?= $(shell echo `nproc` + 0.5 | bc)
export MULTIMAKE ?= $(MAKE) -j -l $(MAX_LOAD)


build: config
	$(MULTIMAKE) -C $@
install: build
	sudo $(MAKE) -C $^ $@
	cd $(STOWDEST)/.. && sudo stow --ignore='[.]cache$$' vlc

debian-dep:
	sudo apt -y install git libtool-bin lua5.1 build-essential pkg-config autoconf libsecret-1-dev
	#sudo apt -y build-dep vlc
fedora-dep:
	sudo dnf -y install git libtool lua pkgconfig

SRC:
	[ -d $@ ] || git submodule add -b master git://git.videolan.org/vlc.git $@
	sh $@/bootstrap
update: SRC
	git submodule update --init
	sh $^/bootstrap
config: SRC
	[ -d build ] || mkdir -p build
	cd build && bash ../SRC/configure --prefix=$(STOWDEST) \
		--disable-nls --enable-pulse \
		--enable-fdkaac=/usr/local --enable-x264=/usr/local --enable-x265=/usr/local --enable-opus=/usr/local --enable-vpx=/usr/local
