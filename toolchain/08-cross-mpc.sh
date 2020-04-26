#!/usr/bin/env bash

#
#
#
#

. ./.config.sh

cd ${src}
wget https://ftp.gnu.org/gnu/mpc/mpc-1.0.3.tar.gz
tar -xvf mpc-1.0.3.tar.gz
cd mpc-1.0.3

LDFLAGS="-Wl,-rpath,/cross-tools/lib" \
./configure --prefix=/cross-tools  \
            --disable-static \
            --with-gmp=/cross-tools \
            --with-mpfr=/cross-tools

make -j$(nproc)
make install
cd ${src} && rm -rf mpc-1.0.3
# end of file
