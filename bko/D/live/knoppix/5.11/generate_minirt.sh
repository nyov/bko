#!/bin/bash
set -e

#cleanup the old mess
echo "Removing the old files"
sudo rm -rf minirt.gz minirt mpoint

# create a copy of image to modify
cp minirt.gz_orig minirt.gz
gunzip minirt.gz
sudo e2fsck -f -y minirt || :
sudo resize2fs minirt 6m 
echo "Mounting the filesystem"
mkdir mpoint
sudo mount minirt -o loop mpoint/

echo "coping the needed files..."
sudo cp modules/* mpoint/modules/
sudo cp busybox mpoint/static/

sudo cp httpfs/server/httpfs mpoint/static/
sudo cp httpfs/server/fusermount mpoint/static/
sudo cp linuxrc mpoint/
sudo cp mount_http_iso.sh mpoint/
sudo chmod 0777 mpoint/linuxrc 
sudo chmod 0777 mpoint/mount_http_iso.sh 

echo "creating environment, creating links..."
cd mpoint/static
sudo chmod 0777 *
sudo ln -s busybox halt
sudo ln -s busybox poweroff
sudo ln -s busybox route
sudo ln -s busybox ifconfig
sudo ln -s busybox ls
sudo ln -s busybox ln
sudo ln -s busybox chmod
sudo ln -s busybox reboot 
sudo ln -s busybox mkdir
sudo ln -s busybox cp
sudo ln -s busybox ps 
sudo ln -s busybox nc 
sudo ln -s busybox rm
sudo ln -s busybox wget
sudo ln -s busybox ping
sudo ln -s busybox dmesg 
sudo ln -s busybox dd 
sudo ln -s busybox mount
sudo ln -s busybox umount
sudo ln -s busybox cut 

cd ..
cd ..

echo "un-mounting the filesystem"
sudo umount mpoint
sudo rmdir mpoint

echo "Compressing the filesystem"
gzip -9 minirt

echo "Done, you can use minirt.gz"

