#! /usr/bin/make -f
STOWDEST ?= ffmpeg
include ../autoconf-template.mk


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
	cd build && sh ../SRC/configure --prefix=$(PREFIX) \
		--disable-static --as=yasm --enable-gpl \
		--enable-nonfree --enable-shared --enable-avresample \
		--enable-avisynth --enable-chromaprint --enable-fontconfig \
		--enable-gnutls --enable-libcaca --enable-libfdk-aac \
		--enable-libfreetype --enable-libfontconfig --enable-libmp3lame --enable-libopus \
		--enable-libtheora --enable-libvorbis --enable-libvpx \
		--enable-libwebp --enable-libx264 --enable-libx265 \
		--enable-openssl 
