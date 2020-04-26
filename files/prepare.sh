################################################
#
################################################
export aa=$(pwd)
export LFS=$aa/xroot
cd $aa
./umount.sh
./umount.sh
rm -rvf $aa/xroot
mkdir $aa/xroot

tar -xvf alpine-minirootfs-3.8.2-x86_64.tar.gz -C $aa/xroot

cp /etc/resolv.conf $LFS/etc
cp pkg.sh $LFS

echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> $aa/xroot/etc/apk/repositories
chroot xroot /bin/sh -c "apk update"
chroot xroot /bin/sh -c "apk add ncurses-terminfo-base"
chroot xroot /bin/sh -c "apk add ncurses-terminfo"
chroot xroot /bin/sh -c "apk add ncurses-libs"
chroot xroot /bin/sh -c "apk add readline"
chroot xroot /bin/sh -c "apk add bash"

echo "Time to Chroot, run chroot.sh"
