#!/bin/bash

#cleanup the old mess
echo "Removing the old files"
rm -rf minitrt24.gz minirt24 mpoint

# create a copy of image to modify
cp minirt24.gz_orig minirt24.gz
gunzip minirt24.gz

echo "Mounting the filesystem"
mkdir mpoint
mount minirt24 -o loop mpoint/

echo "coping the needed files..."
cp modules/* mpoint/modules/
#cp httpfs/static/udhcpc mpoint/static/
#cp httpfs/static/udhcpc.sh mpoint/static/
cp busybox mpoint/static/

cp httpfs/server/httpfs mpoint/static/
cp httpfs/server/fusermount mpoint/static/
cp linuxrc mpoint/
cp mount_http_iso.sh mpoint/
chmod 0777 mpoint/linuxrc 
chmod 0777 mpoint/mount_http_iso.sh 
mknod mpoint/dev/fuse c 10 229

echo "creating environment, creating links..."
cd mpoint/static
chmod 0777 *
ln -s busybox halt
ln -s busybox poweroff
ln -s busybox route
ln -s busybox ifconfig
ln -s busybox ls
ln -s busybox ln
ln -s busybox chmod
ln -s busybox reboot 
ln -s busybox mkdir
ln -s busybox cp
ln -s busybox ps 
ln -s busybox nc 
ln -s busybox rm
ln -s busybox wget
ln -s busybox ping
ln -s busybox dmesg 
ln -s busybox dd 
ln -s busybox mount
ln -s busybox umount
ln -s busybox cut 




cd ..
cd ..

echo "un-mounting the filesystem"
umount mpoint
rmdir mpoint

echo "Compressing the filesystem"
gzip -9 minirt24

echo "Done, you can use minirt24.gz"


