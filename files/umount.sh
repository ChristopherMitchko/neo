#####################################################################
#
#####################################################################
export aa=$(pwd)
export LFS=$aa/xroot

umount -l $LFS
umount -l $LFS/dev
umount -l $LFS/dev/pts
umount -l $LFS/proc
umount -l $LFS/sys
umount -l $LFS/run


