set -e
[[ 0 -lt $(id -u) ]] || SUDO=sudo
MAXLOAD=$(awk "BEGIN { print $(nproc) + 0.5 }")

[[ -w /usr/local/stow ]] && PREFIX=/usr/local/stow/vim || PREFIX=$HOME/.local

cd vim-8.1.0022/
./configure --enable-gui=gnome2 \
	--enable-python3interp=yes \
	--prefix=$PREFIX
make -j -l $MAXLOAD install
