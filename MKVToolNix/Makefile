#! /usr/bin/make -f
STOWDEST ?= MKVToolNix

include ../basic-template.mk

# Must be built in-place
install: config
	cd SRC && rake -N install
	cd $(STOWROOT) && \
		$(SUDO) stow \
		--ignore=share/info/dir --ignore='[.]cache$$' \
		$(STOWDEST) && \
	$(SUDO) ldconfig


# versions of libebml-dev libmatroska-dev are included as submodules
debian-dep:
	$(SUDO) apt install -y autoconf \
		libogg-dev libvorbis-dev zlib1g-dev libboost-all-dev \
		ruby-dev libflac-dev libmagic-dev 


SRC:
	#[ -d $@ ] || git submodule add -b master git://github.com/mbunkus/mkvtoolnix.git $@
	[ -d $@ ] || git clone -b master git://github.com/mbunkus/mkvtoolnix.git $@
update: SRC
	git submodule update --init
	cd SRC && git submodule update --init
config: SRC debian-dep
	cd SRC && sh autogen.sh --prefix=$(PREFIX)
	cd SRC && git submodule update --init
	cd SRC && sh ../SRC/configure --prefix=$(PREFIX) \
		--disable-qt
