#! /usr/bin/env make -f
STOWROOT ?= /usr/local/stow
include macros.mk


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
rpmfusion: VERSION ?= release-23
rpmfusion:
	sudo rpm -Uvh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-$(VERSION).noarch.rpm
	sudo rpm -Uvh http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-$(VERSION).noarch.rpm
#vlc: rpmfusion


include standalone-packages.mk

### Packages with dependencies go here ###

# GIMP and dependencies
gimp: STOWDEST=gimp-2.9
babl gegl lcms libmypaint: STOWDEST=gimp-deps

.PHONY: babl gegl lcms libmypaint gimp
gimp: babl gegl lcms libmypaint
gegl: babl lcms
gimp babl gegl lcms libmypaint:
	[ -d "$@" ]
	$(MULTIMAKE) -C $@ install

# ffmpeg and dependencies
ffmpeg: STOWDEST=ffmpeg
x264 x265 fdk-aac opus libvpx: STOWDEST=ffmpeg-deps

.PHONY: ffmpeg x264 x265 fdk-aac opus libvpx
ffmpeg: x264 x265 fdk-aac opus libvpx

.PHONY: vlc libarchive protobuf
vlc: ffmpeg libarchive protobuf
vlc x264 x265 fdk-aac opus libvpx libarchive protobuf ffmpeg:
	[ -d "$@" ]
	$(MULTIMAKE) -C $@ install

# MP4Box is an alias for gpac
.PHONY: MP4Box gpac
MP4Box: gpac
gpac:
	[ -d "$@" ]
	$(MULTIMAKE) -C $@ install


# rtorrent and dependencies # TODO
.PHONY: rtorrent libtorrent
rtorrent: STOWDEST=$(STOWROOT)/rtorrent
rtorrent: libtorrent
	$(MAKE) -C $@ -f Makefile.recipe config

# tor and dependencies
.PHONY: thttpd tor
tor: VERSION ?= tor-2.0.8.9
thttpd: VERSION ?= thttpd-2.27

thttpd tor:
	[ -d "$@" ]
	$(MULTIMAKE) -C $@ install
