#! /usr/bin/make -f
STOWDEST ?= gimp-deps
### ../autoconf-template.mk includes 'install' as the default target
include ../autoconf-template.mk


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
	cd build && sh ../SRC/autogen.sh --prefix=$(PREFIX)
	cd build && sh ../SRC/configure --prefix=$(PREFIX) \
		--disable-docs
