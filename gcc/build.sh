
set -e
MAXLOAD=$(awk "BEGIN { print $(nproc) + 0.5 }")

[[ -w /usr/local/stow ]] && PREFIX=/usr/local/stow/gcc-8 || PREFIX=$HOME/.local


mkdir -p binutils-build gcc-build

cd binutils-build
../binutils-2.30/configure --prefix=$PREFIX
make -j -l $MAXLOAD # can't be a single step install
make install
cd ..

cd gcc-build
../gcc-8.1.0/configure --prefix=$PREFIX \
	--disable-multilib
make -j -l $MAXLOAD install
cd ..
