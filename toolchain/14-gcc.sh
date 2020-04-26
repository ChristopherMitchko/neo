#!/usr/bin/env bash

#
#
#
#

. ./.config.sh

cd ${src}
wget http://ftp.us.debian.org/debian/pool/main/g/gcc-6/gcc-6_6.3.0.orig.tar.gz
tar -xvf gcc-6_6.3.0.orig.tar.gz
cd gcc-6-6.3.0
tar -xvf gcc-6.3.0-dfsg.tar.xz
cd gcc-6.3.0

cp ${wd}/files/linux.h gcc/config/i386/
cp ${wd}/files/linux64.h gcc/config/i386/

echo -en '\n#undef STANDARD_STARTFILE_PREFIX_1\n#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"\n' >> gcc/config/linux.h
echo -en '\n#undef STANDARD_STARTFILE_PREFIX_2\n#define STANDARD_STARTFILE_PREFIX_2 ""\n' >> gcc/config/linux.h

touch /tools/include/limits.h

mkdir -v ../gcc-build && cd ../gcc-build

AR=ar LDFLAGS="-Wl,-rpath,/cross-tools/lib" \
    ../gcc-6.3.0/configure \
          --prefix=/cross-tools \
          --build=${build} \
          --host=${build} \
          --target=${target} \
          --with-sysroot=${apex} \
          --with-local-prefix=/tools \
          --with-native-system-header-dir=/tools/include \
          --disable-nls \
          --disable-static \
          --enable-languages=c,c++ \
          --enable-__cxa_atexit \
          --enable-threads=posix \
          --with-mpc=/cross-tools \
          --with-mpfr=/cross-tools \
          --with-gmp=/cross-tools \
          --with-cloog=/cross-tools \
          --with-isl=/cross-tools \
          --with-system-zlib \
          --enable-checking=release \
          --enable-libstdcxx-time

make -j$(nproc) AS_FOR_TARGET="${CLFS_TARGET}-as" \
    LD_FOR_TARGET="${CLFS_TARGET}-ld"
make install
cd ${src} && rm -rf gcc-6-6.3.0
# end of file
