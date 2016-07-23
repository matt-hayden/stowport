STOWDEST ?= /usr/local/stow/gimp-2.9


build: config
	$(MULTIMAKE) -C $@
install: build
	$(MAKE) -C build install
	cd $(STOWDEST)/.. && sudo stow gimp-2.9 && sudo ldconfig


debian-dep:
	sudo apt-get install -y autoconf libtool
fedora-dep:
	sudo dnf install -y autoconf libtool


SRC:
	[ -d $@ ] || git submodule add git://git.gnome.org/babl $@
update: SRC
	git submodule update --init
config: SRC
	[ -d build ] || mkdir -p build
	cd build && sh SRC/autogen.sh --prefix=$(STOWDEST)
	cd build && sh SRC/configure --prefix=$(STOWDEST) \
		--disable-docs
