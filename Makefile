STOWROOT ?= /usr/local/stow

LN = cp -Rul
# tune here for the number of processors you want to use simultaneously
MULTIMAKE = $(MAKE) -j 5 -l 4.5


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


# standalone packages
broadcom-4321 cdrtools dlib libressl rxvt-unicode scponly st vim:
	[ -d "$@" ]
	$(MAKE) -C $@ -f Makefile.user config

# GIMP and dependencies
gimp: STOWDEST=$(STOWROOT)/gimp-2.9
gimp: babl gegl libmypaint
	$(MAKE) -C $@ -f Makefile.user config
babl gegl libmypaint:
	$(MAKE) -C $@ -f Makefile.user config

# ffmpeg and dependencies
ffmpeg: STOWDEST=$(STOWROOT)/ffmpeg
ffmpeg: x264 x265 fdk-aac opus libvpx
	$(MAKE) -C $@ -f Makefile.user config
x264: gpac
	$(MAKE) -C $@ -f Makefile.user config
fdk-aac gpac libvpx:
	$(MAKE) -C $@ -f Makefile.user config

# rtorrent and dependencies
rtorrent: STOWDEST=$(STOWROOT)/rtorrent
rtorrent: libtorrent
	$(MAKE) -C $@ -f Makefile.user config
libtorrent:
	$(MAKE) -C $@ -f Makefile.user config

# tor and dependencies
tor: STOWDEST=$(STOWROOT)/tor
tor: libressl
	$(MAKE) -C $@ -f Makefile.user config
