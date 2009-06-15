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
cp httpfs/static/* mpoint/static/

cp httpfs/server/httpfs mpoint/static/
cp httpfs/server/fusermount mpoint/static/
cp linuxrc mpoint/
chmod 0777 mpoint/linuxrc 
mknod mpoint/dev/fuse c 10 229

echo "creating environment, creating links..."
cd mpoint/static
chmod 0777 *
ln -s reboot halt
ln -s reboot poweroff
ln -s ifconfig route
cd ..
cd ..

echo "un-mounting the filesystem"
umount mpoint
rmdir mpoint

echo "Compressing the filesystem"
gzip -9 minirt24

echo "Done, you can use minirt24.gz"


