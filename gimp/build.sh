set -e
MAXLOAD=$(awk "BEGIN { print $(nproc) - 0.5 }")

# Note: somehow, /usr/local/lib/pkgconfig will sometimes lose a+rX permissions.

mkdir -p {libpng,mozjpeg,gexiv2,Little-CMS,libmypaint,babl,libwebp,gegl,gimp}-build

if ! ldconfig -p | grep -iq libpng16.so
then
	cd libpng-build
	../libpng-1.6.34/configure --prefix=/usr/local/stow/gimp-2.9
	make -j -l $MAXLOAD install
	cd ..
	read -p "Done with libpng, you may need to run stow and/or ldconfig"
fi

if ! ldconfig -p | grep -iq /usr/local/lib/libjpeg.so
then
	cd mozjpeg
	autoreconf -fiv
	cd ../mozjpeg-build
	../mozjpeg/configure --prefix=/usr/local/stow/mozjpeg
	make -j -l $MAXLOAD install
	cd ..
	read -p "Done with mozjpeg, you may need to run stow and/or ldconfig"
fi

if ! ldconfig -p | grep -iq /usr/local/lib/libjpeg.so
then
	cd ../gexiv2-build
	../gexiv2-0.10.8/configure --prefix=/usr/local/stow/gimp-2.9 \
		--enable-introspection
	make -j -l $MAXLOAD
	# Python packages
	$SUDO make install
	cd ..
	read -p "Done with gexiv2, you may need to run stow and/or ldconfig"
fi

# lcms-2.9 had a misconfigured build which needed transicc_LDFLAGS = -lm
if ! type transicc
then
	cd Little-CMS
	autoreconf -fiv
	cd ../Little-CMS-build
	../Little-CMS/configure --prefix=/usr/local/stow/gimp-2.9
	make -j -l $MAXLOAD install
	cd ..
	read -p "Done with lcms2, you may need to run stow"
fi

if ! ldconfig -p | grep -iq libbabl-0.1.so
then
	cd babl-build
	../babl-0.1.46/configure --prefix=/usr/local/stow/gimp-2.9
	make -j -l $MAXLOAD install
	cd ..
	read -p "Done with babl, you may need to run stow and/or ldconfig"
fi

if ! ldconfig -p | grep -iq libmypaint-1.3.so.0
then
	cd libmypaint-build
	../libmypaint-1.3.0/configure --prefix=/usr/local/stow/gimp-2.9
	make -j -l $MAXLOAD install
	cd ..
	read -p "Done with libmypaint, you may need to run stow and/or ldconfig"
fi

if ! ldconfig -p | grep -iq libwebp.so.7
then
	cd libwebp
	autoreconf -fiv
	cd ../libwebp-build
	../libwebp/configure --enable-everything \
		--prefix=/usr/local/stow/gimp-2.9
	make -j -l $MAXLOAD install
	cd ..
	read -p "Done with libwebp, you may need to run stow and/or ldconfig"
fi

if ! ldconfig -p | grep -iq libgegl-0.3.so
then
	cd gegl-build
	../gegl-0.3.34/configure --prefix=/usr/local/stow/gimp-2.9
	make -j -l $MAXLOAD install
	cd ..
	read -p "Done with gegl, you may need to run stow and/or ldconfig"
fi

if ! type gimp-2.9
then
	cd gimp-build
	../gimp-2.9.6/configure --prefix=/usr/local/stow/gimp-2.9
	make -j -l $MAXLOAD install
	cd ..
fi
