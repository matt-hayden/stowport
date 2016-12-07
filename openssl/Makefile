#! /usr/bin/make -f
STOWDEST ?= openssl
include ../basic-template.mk
include ../autoconf-template.mk


# custom install
install: build
	$(SUDO) $(MAKE) -C $^ $@
	cd $(STOWROOT) && sudo stow --ignore='[.]cache$$' $(STOWDEST) && sudo ldconfig


SRC:
	[ -d $@ ] || git submodule add -b master \
		git://git.openssl.org/openssl.git $@
update: SRC
	git submodule update --init
	cd $^ && sh autogen.sh --prefix=$(PREFIX)
config:
	- mkdir build
	cd build && sh ../SRC/config --prefix=$(PREFIX) \
		--openssldir=/etc/ssl \
                enable-ec_nistp_64_gcc_128 zlib-dynamic
