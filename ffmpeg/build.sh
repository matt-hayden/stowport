set -e
MAXLOAD=$(awk "BEGIN { print $(nproc) - 0.5 }")


mkdir -p nasm-build ffmpeg-build
if ! type nasm
then
  cd nasm-build
  ../nasm-2.13.03/configure --prefix=/usr/local/stow/nasm
  make -j -l $MAXLOAD install
  cd ..
  read -p "Done with nasm, you may need to run stow"
fi
cd ffmpeg-build
$(readlink -f ../ffmpeg/configure) \
  --prefix=/usr/local/stow/ffmpeg \
  --enable-shared \
  --extra-libs="-lpthread -lm" \
  --enable-gpl \
  --enable-libass \
  --enable-libfdk-aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libtheora \
  --enable-libvorbis \
  --enable-libx264 \
  --enable-libx265 \
  --enable-nonfree
make -j -l $MAXLOAD install
cd ..
