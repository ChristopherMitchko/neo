#!/usr/bin/env bash

#
#
#
#

. ./.config.sh

cd ${src}
wget http://ftp.gnu.org/gnu/gmp/gmp-6.1.0.tar.xz
tar -xvf gmp-6.1.0.tar.xz
cd gmp-6.1.0

./configure --prefix=/cross-tools \
            --enable-cxx \
            --disable-static

make -j$(nproc)
make install
cd ${src} && rm -rf gmp-6.1.0
# end of file
