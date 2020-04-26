#!/usr/bin/env bash

#
#
#
#

. ./.config.sh

cd ${src}
#wget http://ftp.us.debian.org/debian/pool/main/b/binutils/binutils_2.28.orig.tar.gz
#tar -xvf binutils_2.28.orig.tar.gz
cd binutils-2.28

AR=ar AS=as ../binutils-2.28/configure \
    --prefix=/cross-tools  \
    --build=${build} \
    --host=${build} \
    --target=${target} \
    --with-sysroot=${apex}  \
    --with-lib-path=/tools/lib:/tools/lib32 \
    --disable-nls  \
    --disable-static  \
    --enable-64-bit-bfd  \
    --disable-werror

make -j(nproc)
make install
cd ${src} && rm -rf binutils-2.28
# end of file
