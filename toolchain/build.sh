#!/usr/bin/env bash

unset CFLAGS CXXFLAGS PKG_CONFIG_PATH
wd=$(pwd)
apex=/apex
src=${apex}/source
LC_ALL=POSIX
PATH=/cross-tools/bin:/bin:/usr/bin

build="x86_64-unknown-linux-gnu"
host="x86_64-unknown-linux-gnu"
target="x86_64-cross-linux-gnu"
target32="i686-cross-linux-gnu"
targetx32="x86_64-cross-linux-gnux32"
build32="-m32"
build64="-m64"
buildx32="-mx32"

CC="${target}-gcc ${BUILD64}"
CXX="${target}-g++ ${BUILD64}"
AR="${target}-ar"
AS="${target}-as"
RANLIB="${target}-ranlib"
LD="${target}-ld"
STRIP="${target}-strip"

# im using a aarch64 android until i get a laptop
# aarch64-unknown-linux-gnu
#build="aarch64-unknown-linux-gnu"
#host="aarch64-unknown-linux-gnu"
#target="x86_64-cross-linux"
#target32="i686-cross-linux"
#targetx32="x86_64-cross-linux-gnux32"
#build32="-m32"
#build64="-m64"
#buildx32="-mx32"
# end of file
