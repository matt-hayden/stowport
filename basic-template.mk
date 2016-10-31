SUDO ?= sudo

STOWROOT ?= /usr/local/stow
PREFIX ?= $(STOWROOT)/$(STOWDEST)

export ACLOCAL_FLAGS ?= -I $(STOWROOT)/../share/aclocal
export PKG_CONFIG_PATH ?= $(STOWROOT)/../lib/pkgconfig


MAX_LOAD ?= $(shell echo `nproc` + 0.5 | bc)
export MULTIMAKE ?= $(MAKE) -j -l $(MAX_LOAD)
