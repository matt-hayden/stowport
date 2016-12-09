
ifndef STOWROOT
$(error STOWROOT is not set)
endif
ifndef STOWDEST
$(error STOWDEST is not set)
endif

ifndef MULTIMAKE
$(error MULTIMAKE is not set)
endif

export ACLOCAL_FLAGS ?= -I $(STOWROOT)/../share/aclocal
export PKG_CONFIG_PATH ?= $(STOWROOT)/../lib/pkgconfig


install: build
	$(SUDO) -v
	[ -d $(STOWROOT)/../lib/pkgconfig ]
	! [ -L $(STOWROOT)/../lib/pkgconfig ]
	$(MAKE) -C $^ $@
	cd $(STOWROOT) && sudo stow --ignore='[.]cache$$' $(STOWDEST) && sudo ldconfig

build: config
	$(MULTIMAKE) -C $@
