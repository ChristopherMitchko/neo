#!/usr/bin/env bash

#
#
#
#

. ./.config.sh

cd ${src}
wget http://ftp.us.debian.org/debian/pool/main/n/ncurses/ncurses_6.0+20161126.orig.tar.gz
tar -xvf ncurses_6.0+20161126.orig.tar.gz
cd ncurses-6.0-20161126

./configure --prefix=/cross-tools \
    --without-debug --without-shared

make -j$(nproc) -C include
make -j$(nproc) -C progs tic

install -v -m755 progs/tic /cross-tools/bin

cd ${src} && rm -rf ncurses-6.0-20161126
# end of file
