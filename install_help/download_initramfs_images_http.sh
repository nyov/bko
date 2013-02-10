#!/bin/bash
set -e

# pick the configuration information
source ../config

# all scripts are in install folder
cd ..

REMOTE_BKO_LOCATION=$REMOTE_INITRAMFS_DOWNLOAD_LOCATION
REMOTE_BKO_LOCATION="http://boot.rit.edu/"
LOCAL_BKO_LOCATION=`pwd`


echo "downloading dsl initramfs"
FILE_TO_COPY=/bko/live/dsl/minirt24.gz
rm -f $LOCAL_BKO_LOCATION/$FILE_TO_COPY
wget $REMOTE_BKO_LOCATION/$FILE_TO_COPY -O $LOCAL_BKO_LOCATION/$FILE_TO_COPY

echo "downloading knoppix initramfs"
FILE_TO_COPY=/bko/live/knoppix/5.11/minirt.gz
rm -f $LOCAL_BKO_LOCATION/$FILE_TO_COPY
wget $REMOTE_BKO_LOCATION/$FILE_TO_COPY -O $LOCAL_BKO_LOCATION/$FILE_TO_COPY

echo "downloading knoppix6 initramfs"
FILE_TO_COPY=/bko/live/knoppix/6.0.1/minirt.gz
rm -f $LOCAL_BKO_LOCATION/$FILE_TO_COPY
wget $REMOTE_BKO_LOCATION/$FILE_TO_COPY -O $LOCAL_BKO_LOCATION/$FILE_TO_COPY

echo "downloading fedora initramfs"
FILE_TO_COPY=/bko/live/fedora/f11/initrd0.img
rm -f $LOCAL_BKO_LOCATION/$FILE_TO_COPY
wget $REMOTE_BKO_LOCATION/$FILE_TO_COPY -O $LOCAL_BKO_LOCATION/$FILE_TO_COPY

echo "downloading debian initramfs"
FILE_TO_COPY=/bko/live/debian/initmod/initrd1.img
rm -f $LOCAL_BKO_LOCATION/$FILE_TO_COPY
wget $REMOTE_BKO_LOCATION/$FILE_TO_COPY -O $LOCAL_BKO_LOCATION/$FILE_TO_COPY

echo "downloading ubuntu initramfs"
FILE_TO_COPY=/bko/live/ubuntu/U9/initrd.gz
rm -f $LOCAL_BKO_LOCATION/$FILE_TO_COPY
wget $REMOTE_BKO_LOCATION/$FILE_TO_COPY -O $LOCAL_BKO_LOCATION/$FILE_TO_COPY

