set -e
[[ 0 -lt $(id -u) ]] || SUDO=sudo
MAXLOAD=$(awk "BEGIN { print $(nproc) + 0.5 }")

[[ -w /usr/local/stow ]] && PREFIX=/usr/local/stow/gimp-2.10 || PREFIX=$HOME/.local
export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig:$PREFIX/share/pkgconfig

mkdir -p {libmypaint,mypaint-brushes,babl,libwebp,gegl,gimp}-build


if ! [[ -s $PREFIX/lib/libmypaint.so ]]
then
	cd libmypaint-build
	../libmypaint-1.3.0/configure --prefix=$PREFIX
	make -j -l $MAXLOAD install
	cd ..

	cd mypaint-brushes-1.3.0
	./autogen.sh
	cd ../mypaint-brushes-build
	../mypaint-brushes-1.3.0/configure --prefix=$PREFIX
	make -j -l $MAXLOAD install
	cd ..
fi

if ! [[ -s $PREFIX/lib/libbabl-0.1.so ]]
then
	cd babl-build
	../babl-0.1.46/configure --prefix=$PREFIX
	make -j -l $MAXLOAD install
	cd ..
fi

if ! [[ -s $PREFIX/lib/libwebp.so ]]
then
	cd libwebp
	autoreconf -fiv
	cd ../libwebp-build
	../libwebp/configure --enable-everything --prefix=$PREFIX
	make -j -l $MAXLOAD install
	cd ..
fi

# Note: somehow, /usr/local/lib/pkgconfig will sometimes lose a+rX permissions here

if ! [[ -s $PREFIX/lib/libgegl-0.4.so ]]
then
	cd gegl-build
	../gegl-0.4.0/configure --prefix=$PREFIX
	make -j -l $MAXLOAD install
	cd ..
fi

if ! type gimp-2.10
then
	cd gimp-build
	../gimp-2.10.0/configure --prefix=$PREFIX
	make -j -l $MAXLOAD install
	cd ..
fi
