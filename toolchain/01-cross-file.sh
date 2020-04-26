#!/usr/bin/env bash

#
#
#
#

. ./.config.sh

cd ${src}
wget http://ftp.us.debian.org/debian/pool/main/f/file/file_5.30.orig.tar.xz
tar -xvf file_5.30.orig.tar.xz
cd file-5.30

./configure --prefix=/cross-tools --disable-static

make -j$(nproc)
make install
cd ${src} && rm -rf file-5.30
# end of file
