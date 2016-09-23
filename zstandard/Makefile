#! /usr/bin/make -f
STOWDEST ?= /usr/local/stow/zstd

MAX_LOAD ?= $(shell echo `nproc` + 0.5 | bc)
#export MULTIMAKE ?= $(MAKE) -j -l $(MAX_LOAD)


#build: update
#	[ -d $@ ] || mkdir $@
#	cd $@ && cmake -G"Ninja" \
#		-D CMAKE_INSTALL_PREFIX=$(STOWDEST) \
#		../SRC/projects/cmake
#	cd $@ && ninja
#install: build
#	cd $^ && ninja install


debian-dep:
	sudo apt-get install -y \
		cmake ninja-build




SRC:
	[ -d $@ ] || git clone git://github.com/facebook/zstd.git $@
update: SRC
	cd $^ && git fetch --all && git merge
