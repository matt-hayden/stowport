
LN = cp -Rul


debian-dep:
	sudo apt-get install -y build-essential cvs mercurial stow

fedora-dep: rpmfusion
	sudo dnf install -y cvs mercurial stow


Debian:
	$(LN) stowport/$@ .


broadcom-4321:
	$(LN) stowport/$@ .

babl:
	git clone git://git.gnome.org/$@
	$(LN) stowport/$@ .

gegl:
	git clone git://git.gnome.org/$@
	$(LN) stowport/$@ .

libmypaint:
	git clone git://github.com/mypaint/libmypaint.git
	$(LN) stowport/$@ .

gimp: babl gegl libmypaint
	git clone git://git.gnome.org/$@
	$(LN) stowport/$@ .

vim:
	git clone git://github.com/vim/$@.git
	$(LN) stowport/$@ .

dlib:
	git clone git://github.com/davisking/$@.git
	$(LN) stowport/$@ .

rxvt-unicode:
	cvs -z3 -d :pserver:anonymous@cvs.schmorp.de/schmorpforge co $@
	$(LN) stowport/$@ .

ubuntu-fonts: ubuntu-font-family-0.83.zip
	unzip $^ && rm $^

ubuntu-font-family-0.83.zip:
	wget http://font.ubuntu.com/download/$@
	zipinfo $@

yasm:
	git clone git://github.com/yasm/yasm.git
	$(LN) stowport/$@ .

gpac:
	git clone git://github.com/gpac/gpac.git
	$(LN) stowport/$@ .
	
x264: gpac
	git clone git://git.videolan.org/$@
	$(LN) stowport/$@ .

x265:
	hg clone https://bitbucket.org/multicoreware/$@
	$(LN) stowport/$@ .

fdk-aac:
	git clone git://git.code.sf.net/p/opencore-amr/$@
	$(LN) stowport/$@ .

lame-3.99.5.tar.gz:
	wget http://downloads.sourceforge.net/project/lame/lame/3.99/$@
	tar atf $@

lame-3.99.5: lame-3.99.5.tar.gz
	tar axf $^ && rm $^
	$(LN) stowport/$@ .

opus:
	git clone https://git.xiph.org/opus.git
	$(LN) stowport/$@ .

libvpx:
	git clone https://chromium.googlesource.com/webm/$@
	$(LN) stowport/$@ .

ffmpeg: x264 x265 fdk-aac opus libvpx
	git clone git://source.ffmpeg.org/ffmpeg.git
	$(LN) stowport/$@ .

rpmfusion: rpmfusion23

rpmfusion23:
	sudo rpm -Uvh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-23.noarch.rpm
	sudo rpm -Uvh http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-23.noarch.rpm

vlc: rpmfusion

libtorrent:
	git clone git://github.com/rakshasa/libtorrent.git
	$(LN) stowport/$@ .

rtorrent: libtorrent
	git clone git://github.com/rakshasa/rtorrent.git
	$(LN) stowport/$@ .
