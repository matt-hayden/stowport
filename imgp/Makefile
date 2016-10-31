#! /usr/bin/make -f
STOWDEST ?= opt
include ../basic-template.mk


debian-dep:
	pip3 install --user pillow

install: SRC
	$(MAKE) -C $^ PREFIX=$(PREFIX) $@
	cd $(STOWROOT) && sudo stow --ignore='[.]cache$$' $(STOWDEST)


SRC:
	[ -d $@ ] || git submodule add -b master \
		git://github.com/jarun/imgp.git $@
update: SRC
	git submodule update --init
