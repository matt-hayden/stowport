
set -e
SUDO=sudo


$SUDO apt update || echo "update failed"
$SUDO apt install \
  autoconf \
  automake \
  build-essential \
  cmake \
  libass-dev \
  libfreetype6-dev \
  libopus-dev \
  libtheora-dev \
  libtool \
  libfdk-aac-dev \
  libmp3lame-dev \
  libvorbis-dev \
  libx264-dev \
  libx265-dev \
  pkg-config \
  texinfo \
  yasm \
  zlib1g-dev

desktop='libsdl2-dev libva-dev libvdpau-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev'

curl -O 'https://www.nasm.us/pub/nasm/releasebuilds/2.13.03/nasm-2.13.03.tar.xz'
[[ -d ffmpeg ]] || git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg
