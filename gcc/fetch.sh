
: ${CURL='curl -sSL'}

set -e
SUDO=sudo

$CURL \
	-O 'http://mirrors.kernel.org/gnu/binutils/binutils-2.30.tar.xz' \
	-O 'http://mirrors.kernel.org/gnu/binutils/binutils-2.30.tar.xz.sig' \
	-O 'http://mirrors.kernel.org/gnu/gcc/gcc-8.1.0/gcc-8.1.0.tar.xz' \
	-O 'http://mirrors.kernel.org/gnu/gcc/gcc-8.1.0/gcc-8.1.0.tar.xz.sig' \
	&

$SUDO apt update || echo "update failed"
$SUDO apt install \
  autoconf \
  autogen \
  automake \
  build-essential \
  pkg-config \
  flex \
  gnat \
  guile-2.0-dev \
  libmpc-dev \
  libmpfr-dev

wait
