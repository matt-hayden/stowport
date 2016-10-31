#! /usr/bin/make -f
STOWDEST ?= opt
include ../basic-template.mk


# depends on libquadmath


install: SRC
	$(MULTIMAKE) -C $^ PREFIX=$(PREFIX) install
	cd $(STOWROOT) && $(SUDO) stow --ignore='[.]cache$$' $(STOWDEST)

SRC:
	[ -d $@ ] || git submodule add -b master \
		git://github.com/jarun/bcal $@
update: SRC
	git submodule update --init
