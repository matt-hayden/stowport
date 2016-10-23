#! /usr/bin/make -f
STOWDEST ?= /usr/local/stow/mutt

MAX_LOAD ?= $(shell echo `nproc` + 0.5 | bc)
export MULTIMAKE ?= $(MAKE) -j -l $(MAX_LOAD)


build: config
	$(MULTIMAKE) -C $@
install: build
	sudo $(MAKE) -C build install
	cd $(STOWDEST)/.. && sudo stow mutt


SRC:
	[ -d $@ ] || hg clone https://dev.mutt.org/hg/mutt $@
update: SRC
	cd $^ && hg pull -u
config: SRC
	cd SRC && sh prepare --prefix=$(STOWDEST) \
		--docdir=$(STOWDEST)/share/doc/mutt --with-docdir=$(STOWDEST)/share/doc/mutt \
		--with-gnutls --with-gss \
		--disable-nls
	cd SRC && make distclean
	[ -d build ] || mkdir -p build
	cd build && sh ../SRC/configure --prefix=$(STOWDEST) \
		--docdir=$(STOWDEST)/share/doc/mutt --with-docdir=$(STOWDEST)/share/doc/mutt \
		--with-gnutls --with-gss \
		--disable-nls
