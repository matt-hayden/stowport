#! /usr/bin/make -f
STOWDEST ?= /usr/local/stow/ffmpeg


export ACLOCAL_FLAGS ?= -I /usr/local/share/aclocal
export PKG_CONFIG_PATH ?= /usr/local/lib/pkgconfig


MAX_LOAD ?= $(shell echo `nproc` + 0.5 | bc)
export MULTIMAKE ?= $(MAKE) -j -l $(MAX_LOAD)


build: config
	$(MULTIMAKE) -C $@
install: build
	[ -d /usr/local/lib/pkgconfig ]
	! [ -L /usr/local/lib/pkgconfig ]
	$(MAKE) -C $^ $@
	cd $(STOWDEST)/.. && sudo stow ffmpeg && sudo ldconfig


debian-dep:
	sudo apt install -y \
		libmp3lame-dev libogg-dev libvorbis-dev libtheora-dev \
		libchromaprint-dev libcaca-dev libfdk-aac0 libfreetype6-dev libgnutls28-dev \
		libfontconfig1-dev libwebp-dev yasm
	#sudo apt build-dep -y ffmpeg
centos-dep:
	sudo yum install -y \
		autoconf automake gcc gcc-c++ git libtool make mercurial nasm pkgconfig \
		freetype-devel yasm-devel zlib-devel libogg-devel libvorbis-devel libchromaprint-devel libcaca-devel \
		libtheora-devel gnutls-devel


SRC:
	[ -d $@ ] || git submodule add -b master git://source.ffmpeg.org/ffmpeg.git $@
update: SRC
	git submodule update --init
config: SRC
	[ -d build ] || mkdir -p build
	cd build && sh ../SRC/configure --prefix=$(STOWDEST) \
		--disable-static --as=yasm --enable-gpl \
		--enable-nonfree --enable-shared --enable-avresample \
		--enable-avisynth --enable-chromaprint --enable-fontconfig \
		--enable-gnutls --enable-libcaca --enable-libfdk-aac \
		--enable-libfreetype --enable-libfontconfig --enable-libmp3lame --enable-libopus \
		--enable-libtheora --enable-libvorbis --enable-libvpx \
		--enable-libwebp --enable-libx264 --enable-libx265 \
		--enable-openssl 
