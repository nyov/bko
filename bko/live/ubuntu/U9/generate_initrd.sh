#!/bin/bash
set -e

#cleanup the old mess
echo "Removing the old files"
sudo rm -rf initrd.gz initrd mpoint

# create a copy of image to modify
cp initrd.gz_orig initrd.gz
gunzip initrd.gz

echo "extracting filesystem filesystem"
mkdir -p mpoint
cd mpoint 
cpio -ivu --no-absolute-filename  < ../initrd 2> /dev/null
cd ..

echo "coping the needed files..."

cp strace mpoint/bin/

cp run-init mpoint/bin/
chmod 777 mpoint/bin/run-init

cp httpfs/server/httpfs mpoint/bin/
chmod 777 mpoint/bin/httpfs

cp httpfs/server/fusermount mpoint/bin/
chmod 777 mpoint/bin/fusermount

cp init mpoint/
chmod 0777 mpoint/init 

cp casper mpoint/scripts/
chmod 0777 mpoint/scripts/casper

echo "copying iscsi related files..."
mkdir -p mpoint/etc/iscsi
cp iscsi/iscsid.conf mpoint/etc/iscsi/
cp iscsi/initiatorname.iscsi mpoint/etc/iscsi/
cp iscsi/tools/* mpoint/sbin/
cp fdisk mpoint/sbin/

mkdir -p mpoint/modules
cp modules/* mpoint/modules/

sudo chown -R root.root mpoint
cd mpoint
echo "creating initrd from new system filesystem"
echo "Compressing the filesystem"
sudo find . | sudo cpio -oH newc | gzip -9 > ../initrd.gz
cd ..

sudo rm -rf mpoint initrd

echo "Done, you can use initrd.gz"
