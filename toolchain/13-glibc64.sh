#!/usr/bin/env bash

#
#
#
#

. ./.config.sh

cd ${src}
wget http://ftp.us.debian.org/debian/pool/main/g/glibc/glibc_2.28.orig.tar.xz
tar -xvf glibc_2.28.orig.tar.xz
cd glibc-2.28

mkdir -v ../glibc-build && cd ../glibc-build

echo "libc_cv_ssp=no" > config.cache
echo "slibdir=/tools/lib" >> configparms

BUILD_CC="gcc" CC="${target}-gcc ${BUILD64}" \
    AR="${target}-ar" RANLIB="${target}-ranlib" \
    ../glibc-2.28/configure \
    --prefix=/tools \
    --build=${build} \
    --host=${target} \
    --disable-profile \
    --libdir=/tools/lib \
    --enable-kernel=2.6.32 \
    --with-binutils=/cross-tools/bin \
    --with-headers=/tools/include \
    --enable-obsolete-rpc \
    --cache-file=config.cache

make -j$(nproc)
make install
cd ${src} && rm -rf glibc-2.28
# end of file
