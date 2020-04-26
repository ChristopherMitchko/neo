#!/usr/bin/env bash

#
#
#
#

. ./.config.sh

cd ${src}
wget http://www.mpfr.org/mpfr-3.1.3/mpfr-3.1.3.tar.xz
tar -xvf mpfr-3.1.3.tar.xz
cd mpfr-3.1.3

LDFLAGS="-Wl,-rpath,/cross-tools/lib" \
./configure --prefix=/cross-tools \
            --disable-static \
            --with-gmp=/cross-tools

make -j$(nproc)
make install
cd ${src} && rm -rf mpfr-3.1.3
# end of file
