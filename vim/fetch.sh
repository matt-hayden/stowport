
: ${CURL='curl -sSL'}

set -e
[[ 0 -lt $(id -u) ]] && SUDO=sudo

$CURL -O 'https://github.com/vim/vim/archive/v8.1.0022.tar.gz'


$SUDO apt update || echo "update failed"
$SUDO apt-get install -y \
	libatk1.0-dev \
	libbonoboui2-dev \
	libcairo2-dev \
	libgnome2-dev \
	libgnomeui-dev \
	libgtk2.0-dev \
	libncurses5-dev \
	libx11-dev \
	libxpm-dev \
	libxt-dev
wait
