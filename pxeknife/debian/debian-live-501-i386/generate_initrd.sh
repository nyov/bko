#!/bin/bash
set -e

#cleanup the old mess
echo "Removing the old files"
rm -rf initrd.gz initrd mpoint

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

mkdir mpoint/modules
cp modules/* mpoint/modules/


cp httpfs/server/httpfs mpoint/bin/
chmod 777 mpoint/bin/httpfs

cp httpfs/server/fusermount mpoint/bin/
chmod 777 mpoint/bin/fusermount

cp init mpoint/
chmod 0777 mpoint/init 

cp live mpoint/scripts/
chmod 0777 mpoint/scripts/live


cd mpoint
#echo 'no_static_dev=1' >> etc/udev/udev.conf
echo "creating initrd from new system filesystem"

echo "Compressing the filesystem"
find . | cpio -oH newc | gzip -9 > ../initrd1.img
cd ..

rm -rf mpoint initrd


echo "Done, you can use initrd1.img"
