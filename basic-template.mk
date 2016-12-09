SUDO ?= sudo

### packages need to define STOWDEST
ifndef STOWDEST
$(error STOWDEST is not set)
endif

STOWROOT ?= /usr/local/stow
PREFIX ?= $(STOWROOT)/$(STOWDEST)


MAX_LOAD ?= $(shell echo `nproc` + 0.5 | bc)
export MULTIMAKE ?= $(MAKE) -j -l $(MAX_LOAD)
