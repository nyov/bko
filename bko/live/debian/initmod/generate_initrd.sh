#!/bin/bash
set -e

#cleanup the old mess
echo "Removing the old files"
sudo rm -rf initrd.gz initrd1.img initrd mpoint

# create a copy of image to modify
cp initrd1.img_orig initrd.gz
gunzip initrd.gz

echo "extracting filesystem filesystem"
mkdir mpoint
cd mpoint 
cpio -ivu --no-absolute-filename  < ../initrd 2> /dev/null
cd ..

echo "coping the needed files..."


cp run-init mpoint/bin/
chmod 777 mpoint/bin/run-init

echo "copying iscsi related files..."
mkdir mpoint/etc/iscsi
cp iscsi/iscsid.conf mpoint/etc/iscsi/
cp iscsi/initiatorname.iscsi mpoint/etc/iscsi/
cp iscsi/tools/* mpoint/sbin/
rsync -avrHS --progress libs/. mpoint/lib/.

mkdir mpoint/modules
cp modules/* mpoint/modules/


cp httpfs/server/httpfs mpoint/bin/
chmod 777 mpoint/bin/httpfs

cp httpfs/server/fusermount mpoint/bin/
chmod 777 mpoint/bin/fusermount


cp live mpoint/scripts/
chmod 0777 mpoint/scripts/live


sudo chown -R root.root mpoint
cd mpoint
echo "creating initrd from new system filesystem"

echo "Compressing the filesystem"
sudo find . |sudo cpio -oH newc | gzip -9 > ../initrd1.img
cd ..

sudo rm -rf mpoint initrd


echo "Done, you can use initrd1.img"
