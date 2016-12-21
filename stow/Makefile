#! /usr/bin/make -f
SUDO ?= sudo


install:
	$(MAKE) -C build install


alpine-dep:
	$(SUDO) apk add autoconf automake libtool \
		texinfo texlive perl-test-output
debian-dep:
	$(SUDO) apt install -y build-essential libtest-output-perl \
		texlive texi2html


### stow is intolerant of being built outside its source.
### it also needs access to its own .git
build:
	[ -d $@ ] || git clone -b master git://git.savannah.gnu.org/stow.git $@
update: build
	cd $^ && git fetch --all && git merge origin/master
config: update debian-dep
	cd build && libtoolize && aclocal && automake --add-missing && autoconf
	[ -d build ] || mkdir -p build
	cd build && sh configure --prefix=/tmp/stow
