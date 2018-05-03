
: ${CURL='curl -sSL'}

set -e
[[ 0 -lt $(id -u) ]] && SUDO=sudo


$CURL -o 'mypaint-brushes-1.3.0.tar.gz' 'https://github.com/Jehan/mypaint-brushes/archive/v1.3.0.tar.gz'
$CURL	-O 'https://github.com/mypaint/libmypaint/releases/download/v1.3.0/libmypaint-1.3.0.tar.xz' \
	-O 'https://download.gimp.org/pub/babl/0.1/babl-0.1.46.tar.bz2' \
	-O 'https://download.gimp.org/pub/gegl/0.4/gegl-0.4.0.tar.bz2' \
	-O 'https://download.gimp.org/mirror/pub/gimp/v2.10/gimp-2.10.0.tar.bz2' &

[[ -d libwebp ]] || git clone https://chromium.googlesource.com/webm/libwebp

$SUDO apt update || echo "update failed"
sort deps.list | xargs $SUDO apt install -y

wait
