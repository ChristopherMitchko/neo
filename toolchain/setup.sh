#!/usr/bin/env bash

#
#
#
#

. ./.config.sh

mkdir -v -p ${apex}
mkdir -v -p ${apex}/tools
ln -sv ${apex}/tools /

mkdir -v -p ${apex}/cross-tools
ln -sv ${apex}/cross-tools /

mkdir -v -p ${src}
cd ${src}
#wget --input-file=wget-list --continue --directory-prefix=${src}

# end of file
