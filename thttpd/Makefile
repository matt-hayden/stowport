#! /usr/bin/make -f
STOWDEST ?= thttpd

VERSION ?= thttpd-2.27

include ../basic-template.mk


# custom build
build: config
	$(MULTIMAKE) -C SRC/$(VERSION)
# custom install
install: build
	$(SUDO) -v
	@ echo $(VERSION) will run as:
	@ id bin
	$(SUDO) mkdir -p $(PREFIX)/www
	id -u www || $(SUDO) useradd -d $(PREFIX)/www -r -s /sbin/nologin -U www
	$(SUDO) $(MAKE) -C SRC/$(VERSION) $@

debian-dep:
	sudo apt -y install libevent-dev libsystemd-dev


%.gz %.xz:
	wget http://www.acme.com/software/thttpd/$@
SRC: $(VERSION).tar.gz
	mkdir $@ && tar -C $@ -axf $^
	patch -p0 < patches/MANDIR.patch
config: SRC
	cd SRC/$(VERSION) && bash configure --prefix=$(PREFIX) \
		--localstatedir=/var
