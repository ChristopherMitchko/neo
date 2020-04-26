#!/usr/bin/env bash

#
#
#
#

. ./.config.sh

cd ${src}
# original pkg-config url
# http://ftp.us.debian.org/debian/pool/main/p/pkg-config/pkg-config_0.29.orig.tar.gz
# using pkg-config-lite with no glib dependency
wget https://sourceforge.net/projects/pkgconfiglite/files/0.28-1/pkg-config-lite-0.28-1.tar.gz
tar -xvf pkg-config-lite-0.28-1.tar.gz
cd pkg-config-lite-0.28-1

./configure --prefix=/cross-tools \
            --build=${build} \
            --host=${build} \
            --target=${target} \
            --with-pc-path=/tools/lib/pkgconfig:/tools/share/pkgconfig

make -j$(nproc)
make install
cd ${src} && rm -rf pkg-config-lite-0.28-1
# end of file
