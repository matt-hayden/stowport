#! /usr/bin/make -f
STOWDEST ?= gimp-deps
include ../autoconf-template.mk


debian-dep:
	sudo apt -y install autoconf libtool intltool \
		libjson-glib-dev libjpeg-dev libpng12-dev libtiff5-dev libwebp-dev libgdk-pixbuf2.0-dev

fedora-dep:
	sudo dnf install -y gcc-c++ autoconf libtool intltool \
		json-glib-devel libjpeg-turbo-devel libpng-devel libtiff-devel libwebp-devel gdk-pixbuf2-devel


SRC:
	[ -d $@ ] || git submodule add -b master git://git.gnome.org/gegl $@
update: SRC
	git submodule update --init
config: SRC
	[ -d build ] || mkdir -p build
	cd build && sh ../SRC/autogen.sh --prefix=$(PREFIX)
	cd build && sh ../SRC/configure --prefix=$(PREFIX) \
		--disable-docs --disable-nls --disable-glibtest
