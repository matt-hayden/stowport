STOWROOT ?= /usr/local/stow

LN = cp -Rul
MAX_LOAD = $(shell echo `nproc` + 0.5 | bc)
export MULTIMAKE = $(MAKE) -j -l $(MAX_LOAD)


update:
	git fetch --all
	git merge origin/master


debian-dep:
	sudo apt-get install -y build-essential cvs git mercurial stow wget
centos-dep:
	sudo yum install -y epel-release
	sudo yum install -y cvs git mercurial stow wget
fedora-dep: rpmfusion
	sudo dnf install -y cvs git mercurial stow

# more centos:
rpmfusion: rpmfusion23
rpmfusion23:
	sudo rpm -Uvh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-23.noarch.rpm
	sudo rpm -Uvh http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-23.noarch.rpm
vlc: rpmfusion


# standalone packages that nicely provide a Makefile
cdrtools libressl rxvt-unicode scponly:
	[ -d "$@" ]
	$(MULTIMAKE) -C $@ -f Makefile.recipe config
	$(MULTIMAKE) -C $@
# less-than-nice packages where my Makefile does errythang:
broadcom-4321 dlib opencv st vim:
	[ -d "$@" ]
	$(MULTIMAKE) -C $@ -f Makefile.recipe
.PHONY: broadcom-4321 cdrtools dlib libressl opencv phash rxvt-unicode scponly st vim

# GIMP and dependencies
gimp: STOWDEST=$(STOWROOT)/gimp-2.9
gimp: babl gegl libmypaint
	[ -d "$@" ]
	$(MULTIMAKE) -C $@
babl gegl gpac libmypaint:
	[ -d "$@" ]
	$(MULTIMAKE) -C $@
.PHONY: babl gegl gpac libmypaint

# ffmpeg and dependencies
ffmpeg: STOWDEST=$(STOWROOT)/ffmpeg
ffmpeg: x264 x265 fdk-aac opus libvpx
	$(MAKE) -C $@ -f Makefile.recipe config
x264: gpac
	$(MAKE) -C $@ -f Makefile.recipe config
fdk-aac libvpx:
	$(MAKE) -C $@ -f Makefile.recipe config

# rtorrent and dependencies
rtorrent: STOWDEST=$(STOWROOT)/rtorrent
rtorrent: libtorrent
	$(MAKE) -C $@ -f Makefile.recipe config
libtorrent:
	$(MAKE) -C $@ -f Makefile.recipe config

# tor and dependencies
tor: STOWDEST=$(STOWROOT)/tor
tor: libressl
	$(MAKE) -C $@ -f Makefile.recipe config
