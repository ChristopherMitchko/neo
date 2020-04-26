#!/usr/bin/env bash

#
#
#
#

. ./.config.sh

cd ${src}
#wget http://ftp.us.debian.org/debian/pool/main/l/linux/linux_4.9.25.orig.tar.xz
#tar -xvf linux_4.9.25.orig.tar.xz
cd linux-4.9.25

make -j$(nproc) mrproper
make -j$(nproc) ARCH=x86_64 headers_check
make -j$(nproc) ARCH=x86_64 INSTALL_HDR_PATH=/tools headers_install

cd ${src} && rm -rf linux-4.9.25
# end of file
