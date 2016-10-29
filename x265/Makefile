#! /usr/bin/make -f
STOWDEST ?= x265
include ../autoconf-template.mk


debian-dep:
	sudo apt -y install cmake mercurial yasm


SRC:
	[ -d $@ ] || hg clone https://bitbucket.org/multicoreware/x265 $@
update: SRC
	cd $^ && hg pull -u
config: SRC
	[ -d build ] || mkdir -p build
	cd build && cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=$(PREFIX) ../SRC/source
