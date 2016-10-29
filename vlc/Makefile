#! /usr/bin/make -f
STOWDEST ?= vlc
include ../autoconf-template.mk


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
	cd build && bash ../SRC/configure --prefix=$(PREFIX) \
		--disable-nls --enable-pulse \
		--enable-fdkaac=/usr/local --enable-x264=/usr/local --enable-x265=/usr/local --enable-opus=/usr/local --enable-vpx=/usr/local
