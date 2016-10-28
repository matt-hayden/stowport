#! /usr/bin/make -f
STOWDEST ?= /usr/local/stow/gimp-2.9

MAX_LOAD ?= $(shell echo `nproc` + 0.5 | bc)
export MULTIMAKE ?= $(MAKE) -j -l $(MAX_LOAD)


export ACLOCAL_FLAGS ?= -I /usr/local/share/aclocal
export PKG_CONFIG_PATH ?= /usr/local/lib/pkgconfig


build: config
	$(MULTIMAKE) -C $@
install: build
	[ -d /usr/local/lib/pkgconfig ]
	! [ -L /usr/local/lib/pkgconfig ]
	$(MAKE) -C $^ $@
	cd $(STOWDEST)/.. && sudo stow --ignore='[.]cache$$' gimp-2.9 && sudo ldconfig


debian-dep:
	sudo apt -y install autoconf libtool \
		gtk-doc-tools libgudev-1.0-dev libgtk-3-dev libgexiv2-dev \
		libaa1-dev python-dev python-gtk2-dev libbz2-dev \
		liblzma-dev python-cairo-dev libxpm-dev librsvg2-dev
	sudo apt -y build-dep gimp

fedora-dep:
	sudo dnf install -y \
		gtk-doc libgudev-devel gtk2-devel libgexiv2-devel aalib-devel \
		python-devel pygtk2-devel bzip2-devel xz-devel


SRC:
	[ -d $@ ] || git submodule add -b GIMP_2_9_4 git://git.gnome.org/gimp $@
update: SRC
	git submodule update --init
config: SRC
	[ -d build ] || mkdir -p build
	cd build && sh ../SRC/autogen.sh --prefix=$(STOWDEST)
	cd build && bash ../SRC/configure --prefix=$(STOWDEST) \
		--disable-docs --disable-nls --disable-glibtest
