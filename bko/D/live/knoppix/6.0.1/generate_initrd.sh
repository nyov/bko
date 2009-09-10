#!/bin/bash
set -e

#cleanup the old mess
echo "Removing the old files"
rm -rf minirt.gz minirt mpoint

cp minirt.gz_orig minirt.gz
# create a copy of image to modify
gunzip minirt.gz

echo "extracting filesystem filesystem"
mkdir mpoint
cd mpoint 
cpio -ivu --no-absolute-filename  < ../minirt 2> /dev/null
cd ..

echo "coping the needed files..."


#cp run-init mpoint/bin/
#chmod 777 mpoint/bin/run-init

echo "copying iscsi related files..."
mkdir -p mpoint/etc/iscsi
mkdir -p mpoint/sbin/
cp iscsi/iscsid.conf mpoint/etc/iscsi/
cp iscsi/initiatorname.iscsi mpoint/etc/iscsi/
cp iscsi/tools/* mpoint/sbin/

mkdir -p mpoint/modules
cp modules/* mpoint/modules/

cp httpfs/server/httpfs mpoint/bin/
chmod 777 mpoint/bin/httpfs

cp httpfs/server/fusermount mpoint/bin/
chmod 777 mpoint/bin/fusermount

cp init mpoint/
chmod 0777 mpoint/init 

cp mount_http_iso.sh mpoint/bin
chmod 0777 mpoint/bin/mount_http_iso.sh

chown -R root.root mpoint
cd mpoint
echo "creating initrd from new system filesystem"

echo "Compressing the filesystem"
find . | cpio -oH newc | gzip -9 > ../minirt.gz
cd ..

rm -rf mpoint minirt 

echo "Done, you can use minirt.gz"
