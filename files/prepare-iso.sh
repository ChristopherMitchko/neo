################################################################
#
################################################################
export aa=$(pwd)
export LFS=$aa/xroot
export iso=$aa/iso

rm $aa/files/system.img.gz
cp $LFS/boot/vmlinuz-vanilla $aa/files
mv $LFS/source $aa/files
mv $LFS/tools $aa/files
cd $LFS
cp $aa/files/init $LFS
#Packs  current 'initramfs' folder structure in 'cpio.xz' archive.
find . | cpio -H newc -ov | gzip -9 > $aa/files/system.img.gz

rm -rf $iso
mkdir $iso

mkdir $iso/boot
cp $aa/files/system.img.gz $iso/boot/
#cp $LFS/boot/initramfs-vanilla $iso/boot
cp $aa/files/vmlinuz-vanilla $iso/boot

rm -rf $aa/files/syslinux
mkdir $aa/files/syslinux

cd $aa/files/syslinux
wget http://kernel.org/pub/linux/utils/boot/syslinux/syslinux-6.03.tar.xz

tar -xvf syslinux-6.03.tar.xz
cd syslinux-6.03

mkdir $iso/boot/syslinux

cp $aa/files/syslinux.cfg $iso/boot/syslinux

cp bios/core/isolinux.bin $iso/boot/syslinux

cp bios/com32/elflink/ldlinux/ldlinux.c32 $iso/boot/syslinux

