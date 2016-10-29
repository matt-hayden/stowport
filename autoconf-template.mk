STOWROOT ?= /usr/local/stow
PREFIX ?= $(STOWROOT)/$(STOWDEST)

export ACLOCAL_FLAGS ?= -I $(STOWROOT)/../share/aclocal
export PKG_CONFIG_PATH ?= $(STOWROOT)/../lib/pkgconfig


MAX_LOAD ?= $(shell echo `nproc` + 0.5 | bc)
export MULTIMAKE ?= $(MAKE) -j -l $(MAX_LOAD)


install: build
	[ -d $(STOWROOT)/../lib/pkgconfig ]
	! [ -L $(STOWROOT)/../lib/pkgconfig ]
	$(MAKE) -C $^ $@
	cd $(STOWROOT) && sudo stow --ignore='[.]cache$$' $(STOWDEST) && sudo ldconfig

build: config
	$(MULTIMAKE) -C $@
