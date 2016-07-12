#! /usr/bin/make -f
STOWDEST ?= /usr/local/stow/gimp-2.9

MAX_LOAD ?= $(shell echo `nproc` + 0.5 | bc)
export MULTIMAKE ?= $(MAKE) -j -l $(MAX_LOAD)


export ACLOCAL_FLAGS ?= -I /usr/local/share/aclocal
export PKG_CONFIG_PATH ?= /usr/local/lib/pkgconfig


build: config
	$(MULTIMAKE) -C $@
install: build
	$(MAKE) -C build install
	cd $(STOWDEST)/.. && sudo stow gimp-2.9 && sudo ldconfig


debian-dep:
	sudo apt-get install -y autoconf libtool \
		gtk-doc-tools libgudev-1.0-dev libgtk-3-dev libgexiv2-dev \
		libaa1-dev python-dev python-gtk2-dev libbz2-dev \
		liblzma-dev liblcms2-dev python-cairo-dev libxpm-dev

fedora-dep:
	sudo dnf install -y \
		gtk-doc libgudev-devel gtk2-devel libgexiv2-devel aalib-devel \
		python-devel pygtk2-devel bzip2-devel xz-devel lcms2-devel
debian-dep:
	sudo apt-get install -y autoconf libtool intltool \
		libjson-glib-dev libjpeg-dev libpng12-dev libtiff5-dev libwebp-dev libgdk-pixbuf2.0-dev

fedora-dep:
	sudo dnf install -y gcc-c++ autoconf libtool intltool \
		json-glib-devel libjpeg-turbo-devel libpng-devel libtiff-devel libwebp-devel gdk-pixbuf2-devel


SRC:
	[ -d $@ ] || git submodule add git://git.gnome.org/gimp $@
update: SRC
	git submodule update --init
config: SRC
	[ -d build ] || mkdir -p build
	cd build && sh ../SRC/autogen.sh --prefix=$(STOWDEST)
	cd build && sh ../SRC/configure --prefix=$(STOWDEST) \
		--disable-docs --disable-nls --disable-glibtest
