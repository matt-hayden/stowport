
LN = cp -Rul

fedora-dep: rpmfusion
	sudo dnf install -y stow


broadcom-4321:
	$(LN) stowport/$@ .
	
babl:
	git clone git://git.gnome.org/$@
	$(LN) stowport/$@ .

gegl:
	git clone git://git.gnome.org/$@
	$(LN) stowport/$@ .

libmypaint:
	git clone git://git.gnome.org/$@.git
	$(LN) stowport/$@ .

gimp: babl gegl libmypaint
	git clone git://git.gnome.org/$@
	$(LN) stowport/$@ .

vim:
	git clone git://github.com/vim/$@.git
	$(LN) stowport/$@ .

dlib:
	git clone git://github.com:davisking/$@.git
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

x264:
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
	tar tf $@

lame-3.99.5: $@.tar.gz
	tar axf $^ && rm $^
	$(LN) stowport/$@ .

opus:
	git clone git://git.opus-codec.org/opus.git
	$(LN) stowport/$@ .

libvpx:
	git clone https://chromium.googlesource.com/webm/$@
	$(LN) stowport/$@ .

ffmpeg: yasm x264 x265 fdk-aac lame-3.99.5 opus libvpx
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
