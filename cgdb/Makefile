#! /usr/bin/make -f
STOWDEST ?= cgdb

include ../basic-template.mk
include ../autoconf-template.mk


debian-dep:
	$(SUDO) apt install -y flex help2man


SRC:
	[ -d $@ ] || git submodule add -b master git://github.com/cgdb/cgdb.git $@
update: SRC
	git submodule update --init
config: SRC debian-dep
	cd SRC && sh autogen.sh --prefix=$(PREFIX)
	[ -d build ] || mkdir -p build
	cd build && sh ../SRC/configure --prefix=$(PREFIX)
