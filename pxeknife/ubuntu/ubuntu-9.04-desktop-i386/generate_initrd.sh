#!/bin/bash

#cleanup the old mess
echo "Removing the old files"
rm -rf initrd.gz initrd mpoint

# create a copy of image to modify
cp initrd.gz_orig initrd.gz
gunzip initrd.gz

echo "extracting filesystem filesystem"
mkdir mpoint
cd mpoint 
cpio -ivu --no-absolute-filename  < ../initrd 2> /dev/null
cd ..

echo "coping the needed files..."

#rm mpoint/lib/modules/2.6.28-11-generic/kernel/ubuntu/squashfs/squashfs.ko
#cp squashfs.ko mpoint/lib/modules/2.6.28-11-generic/kernel/ubuntu/squashfs/

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


cd mpoint
#echo 'no_static_dev=1' >> etc/udev/udev.conf
echo "creating initrd from new system filesystem"

echo "Compressing the filesystem"
find . | cpio -oH newc | gzip -9 > ../initrd.gz
cd ..

rm -rf mpoint initrd


echo "Done, you can use initrd.gz"
