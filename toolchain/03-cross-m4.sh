#!/usr/bin/env bash

#
#
#
#

. ./.config.sh

cd ${src}
wget http://ftp.us.debian.org/debian/pool/main/m/m4/m4_1.4.17.orig.tar.xz
tar -xvf m4_1.4.17.orig.tar.xz
cd m4-1.4.17

./configure --prefix=/cross-tools

make -j$(nproc)
make install
cd ${src} && rm -rf m4-1.4.17
# end of file
