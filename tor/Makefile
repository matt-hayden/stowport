#! /usr/bin/make -f
STOWDEST ?= tor
include ../autoconf-template.mk

VERSION ?= tor-0.2.8.9

debian-dep:
	sudo apt -y install libevent-dev


import:
	- gpg2 --keyserver pool.sks-keyservers.net --recv-keys 0x6AFEE6D49E92B601
	- gpg2 --keyserver pool.sks-keyservers.net --recv-keys 0x910397D88D29319A
%.gz:
	wget https://www.torproject.org/dist/$@
	wget https://www.torproject.org/dist/$@.asc
	- gpg2 --verify $@.asc
SRC: $(VERSION).tar.gz
	mkdir $@ && tar -C $@ -axf $^
config: SRC
	mkdir -p build
	cd build && bash ../SRC/$(VERSION)/configure --prefix=$(PREFIX)
