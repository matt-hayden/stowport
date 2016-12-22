#! /usr/bin/make -f
STOWDEST ?= rust

include ../basic-template.mk

rustup.sh:
	wget https://static.rust-lang.org/rustup.sh

### Custom install:
install: rustup.sh
	$(SUDO) -v
	sh rustup.sh --prefix=$(PREFIX) \
		--disable-sudo --disable-ldconfig
	cd $(STOWROOT) && \
		$(SUDO) stow --ignore='[.]cache$$' $(STOWDEST) && \
		$(SUDO) ldconfig

