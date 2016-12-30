#! /usr/bin/make -f
STOWDEST ?= flex
include ../basic-template.mk
include ../autoconf-template.mk


debian-dep:
	$(SUDO) apt install -y \
		automake autoconf m4 texinfo bison gettext help2man indent


SRC:
	[ -d $@ ] || git submodule add -b master git://github.com/westes/flex.git $@
	cd $@ && sh autogen.sh
update: SRC
	git submodule update --init
config: SRC
	[ -d build ] || mkdir -p build
	cd build && sh ../SRC/configure --prefix=$(PREFIX) \
		--disable-static --disable-nls
