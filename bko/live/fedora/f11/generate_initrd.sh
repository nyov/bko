#!/bin/bash
set -e

#cleanup the old mess
echo "Removing the old files"
sudo rm -rf initrd0 initrd0.img initrd0.gz mpoint



# create a copy of image to modify
cp initrd0.img_orig initrd0.gz
gunzip initrd0.gz
mkdir mpoint

echo "extracting filesystem filesystem"
cd mpoint 
cpio -ivu --no-absolute-filename  < ../initrd0 2> /dev/null

cd ..

echo "copying the needed tools..."


cp mount_http_iso.sh mpoint/bin/
cp mount_nfs_iso.sh mpoint/bin/
chmod 777 mpoint/bin/mount_http_iso.sh
chmod 777 mpoint/bin/mount_nfs_iso.sh

cp httpfs/server/httpfs mpoint/bin/
chmod 777 mpoint/bin/httpfs

cp httpfs/server/fusermount mpoint/bin/
chmod 777 mpoint/bin/fusermount

cp mount.nfs mpoint/sbin/

cp busybox mpoint/bin/
chmod 777 mpoint/bin/busybox

cp init mpoint/
chmod 0777 mpoint/init 

cp real-init mpoint/sbin/
chmod 0777 mpoint/sbin/real-init 

cp run-init mpoint/sbin/
chmod 0777 mpoint/sbin/run-init 

echo "Creating soft links"
cd mpoint/bin
ln -s busybox ifconfig
ln -s busybox route 
ln -s busybox vi 
ln -s busybox ping
ln -s busybox wget 

cd ../..


echo "copying kernel modules"
mkdir mpoint/modules
cp modules/* mpoint/modules/

sudo chown -R root.root mpoint

cd mpoint
echo "creating initrd from new system filesystem"

echo "Compressing the filesystem"
sudo find . |sudo cpio -oH newc | gzip -9 > ../initrd0.img
cd ..

sudo rm -rf mpoint initrd0


echo "Done, you can use initrd0.gz"
