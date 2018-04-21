
set -e
SUDO=sudo


$SUDO apt update || echo "update failed"
xargs $SUDO apt install -y < deps.list

curl -LO 'https://download.sourceforge.net/libpng/libpng-1.6.34.tar.xz'
[[ -d mozjpeg ]] || git clone git://github.com/mozilla/mozjpeg.git
curl -LO 'https://download.gnome.org/sources/gexiv2/0.10/gexiv2-0.10.8.tar.xz'
curl -LO 'https://github.com/mm2/Little-CMS/archive/lcms2.9.tar.gz'
curl -LO 'https://github.com/mypaint/libmypaint/releases/download/v1.3.0/libmypaint-1.3.0.tar.xz'
curl -LO 'https://download.gimp.org/pub/babl/0.1/babl-0.1.46.tar.bz2'
[[ -d libwebp ]] || git clone https://chromium.googlesource.com/webm/libwebp
curl -LO 'https://download.gimp.org/pub/gegl/0.3/gegl-0.3.34.tar.bz2'

#[[ -d gimp ]] || git clone git://git.gnome.org/gimp
curl -LO 'https://download.gimp.org/mirror/pub/gimp/v2.9/gimp-2.9.6.tar.bz2'

# And decompress any archives
