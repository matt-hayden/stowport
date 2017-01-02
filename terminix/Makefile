#! /usr/bin/make -f
include ../macros.mk

build: SRC debian-dep
	dub --parallel --root=SRC
debian-dep:
	$(SUDO) apt install -y dub


SRC:
	[ -d $@ ] || git submodule add -b master git://github.com/gnunn1/terminix.git $@
update: SRC
	git submodule update --init
