
#!/usr/bin/env bash
#
#
#
#
#
#-----------------------------------------------------------------
# build busybox dpkg, dpkg-deb
wget https://busybox.net/downloads/busybox-1.31.1.tar.bz2
tar -xvjf busybox-1.31.1.tar.bz2
cp build.config busybox-1.31.1/.config
cd busybox-1.31.1/
make -j$(nproc)
make install
cp -rfv _install/* /bin
#-----------------------------------------------------------------
