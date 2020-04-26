#!/usr/bin/env bash

#
#
#
#

. ./.config.sh

cd ${src}
# old isl breaks gcc-6.3.0, isl-16 recommended
wget http://isl.gforge.inria.fr/isl-0.16.tar.xz
tar -xvf isl-0.16.tar.xz
cd isl-0.16

LDFLAGS="-Wl,-rpath,/cross-tools/lib" \
./configure --prefix=/cross-tools \
            --disable-static \
            --with-gmp-prefix=/cross-tools

make -j(nproc)
make install
cd ${src} && rm -rf isl-0.16
# end of file
