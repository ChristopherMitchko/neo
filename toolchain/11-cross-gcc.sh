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
    ../gcc-6.3.0/configure --prefix=/cross-tools \
    --build=${build} \
    --host=${build} \
    --target=${target} \
    --with-sysroot=${apex} \
    --with-local-prefix=/tools \
    --with-native-system-header-dir=/tools/include \
    --disable-nls \
    --disable-shared \
    --with-mpfr=/cross-tools \
    --with-gmp=/cross-tools \
    --with-cloog=/cross-tools \
    --with-mpc=/cross-tools  \
    --without-headers \
    --with-newlib  \
    --disable-decimal-float  \
    --disable-libgomp  \
    --disable-libmudflap \
    --disable-libssp  \
    --disable-libatomic  \
    --disable-libitm \
    --disable-libsanitizer  \
    --disable-libquadmath \
    --disable-threads \
    --disable-target-zlib  \
    --with-system-zlib  \
    --with-isl=/cross-tools \
    --enable-languages=c  \
    --enable-checking=release

make -j$(nproc) all-gcc all-target-libgcc
make install-gcc install-target-libgcc

cd ${src} && rm -rf gcc-6-6.3.0
# end of file
