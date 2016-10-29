STOWROOT ?= /usr/local/stow

LN = cp -Rul
MAX_LOAD = $(shell echo `nproc` + 0.5 | bc)
export MULTIMAKE = $(MAKE) -j -l $(MAX_LOAD)


update:
	git fetch --all
	git merge origin/master
	git submodule update


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


libsodium mutt:
	[ -d "$@" ]
	$(MULTIMAKE) -C $@
.PHONY: libsodium mutt


# GIMP and dependencies
gimp: STOWDEST=gimp-2.9
babl gegl lcms libmypaint: STOWDEST=gimp-deps
gimp: babl gegl lcms libmypaint
gegl: babl lcms
gimp babl gegl lcms libmypaint:
	[ -d "$@" ]
	$(MULTIMAKE) -C $@ install
.PHONY: babl gegl lcms libmypaint

# ffmpeg and dependencies
ffmpeg: STOWDEST=ffmpeg
x264 x265 fdk-aac opus libvpx: STOWDEST=ffmpeg-deps
.PHONY: x264 x265 fdk-aac opus libvpx
ffmpeg: x264 x265 fdk-aac opus libvpx
.PHONY: ffmpeg libarchive protobuf
vlc: ffmpeg libarchive protobuf
vlc x264 x265 fdk-aac opus libvpx libarchive protobuf ffmpeg:
	[ -d "$@" ]
	$(MULTIMAKE) -C $@ install

.PHONY: MP4Box gpac
MP4Box: gpac
gpac:
	[ -d "$@" ]
	$(MULTIMAKE) -C $@ install


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
