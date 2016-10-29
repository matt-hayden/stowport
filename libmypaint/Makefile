#! /usr/bin/make -f
STOWDEST ?= gimp-deps
include ../autoconf-template.mk


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
	cd build && sh ../SRC/autogen.sh --prefix=$(PREFIX)
	cd build && sh ../SRC/configure --prefix=$(PREFIX)
