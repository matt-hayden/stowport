#! /usr/bin/make -f
STOWDEST ?= gpac
include ../autoconf-template.mk

# custom installation
reinstall:
	$(MAKE) -C build install
	mkdir $(PREFIX)/include
	cp -Ruv -t $(PREFIX)/include SRC/include/gpac
	cd $(STOWROOT) && sudo stow gpac

debian-dep:
	sudo apt-get install -y \
		libssl-dev libxmlrpc-core-c3-dev libwxgtk3.0-dev \
		libjpeg-dev libpng12-dev libfreetype6-dev \
		libasound2-dev libmozjs185-dev zlib1g-dev \
		libxv-dev libxvidcore-dev libopenjpeg-dev liba52-0.7.4-dev libfaad-dev \
		libogg-dev libvorbis-dev libtheora-dev libpulse-dev
#fedora-dep:
#	sudo dnf install -y yasm-devel


SRC:
	[ -d $@ ] || git submodule add -b master git://github.com/gpac/gpac.git $@
update: SRC
	git submodule update --init
config: SRC
	[ -d build ] || mkdir -p build
	chmod +x SRC/configure
	cd build && sh ../SRC/configure \
		--prefix=$(PREFIX) --mandir=$(PREFIX)/share/man \
		--disable-static \
		--use-ffmpeg=/usr/local --enable-pic

