#!/bin/bash
set -e

# pick the configuration information
source ../configure

# all scripts are in install folder
cd ..

REMOTE_BKO_LOCATION=$REMOTE_INITRAMFS_DOWNLOAD_LOCATION
LOCAL_BKO_LOCATION=`pwd`


echo "downloading dsl initramfs"
FILE_TO_COPY=/pxeknife/dsl/minirt24.gz
rm -f $LOCAL_BKO_LOCATION/$FILE_TO_COPY
wget $REMOTE_BKO_LOCATION/$FILE_TO_COPY -O $LOCAL_BKO_LOCATION/$FILE_TO_COPY

echo "downloading knoppix initramfs"
FILE_TO_COPY=/pxeknife/knoppix/5.0.1/minirt.gz
rm -f $LOCAL_BKO_LOCATION/$FILE_TO_COPY
wget $REMOTE_BKO_LOCATION/$FILE_TO_COPY -O $LOCAL_BKO_LOCATION/$FILE_TO_COPY

echo "downloading fedora initramfs"
FILE_TO_COPY=/pxeknife/red_hat/fedora_11_live_cd/initrd0.img 
rm -f $LOCAL_BKO_LOCATION/$FILE_TO_COPY
wget $REMOTE_BKO_LOCATION/$FILE_TO_COPY -O $LOCAL_BKO_LOCATION/$FILE_TO_COPY

echo "downloading debian initramfs"
FILE_TO_COPY=/pxeknife/debian/debian-live-501-i386/initrd1.img
rm -f $LOCAL_BKO_LOCATION/$FILE_TO_COPY
wget $REMOTE_BKO_LOCATION/$FILE_TO_COPY -O $LOCAL_BKO_LOCATION/$FILE_TO_COPY

echo "downloading ubuntu initramfs"
FILE_TO_COPY=/pxeknife/ubuntu/ubuntu-9.04-desktop-i386/initrd.gz
rm -f $LOCAL_BKO_LOCATION/$FILE_TO_COPY
wget $REMOTE_BKO_LOCATION/$FILE_TO_COPY -O $LOCAL_BKO_LOCATION/$FILE_TO_COPY

