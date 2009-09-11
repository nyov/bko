#!/bin/bash
set -e

# pick the configuration information
source ../bko/configure

# all scripts are in install folder
cd ..

REMOTE_BKO_LOCATION=$REMOTE_INITRAMFS_DOWNLOAD_LOCATION
LOCAL_BKO_LOCATION=`pwd`


echo "downloading dsl initramfs"
FILE_TO_COPY=/D/dsl/minirt24.gz
rm -f $LOCAL_BKO_LOCATION/$FILE_TO_COPY
wget $REMOTE_BKO_LOCATION/$FILE_TO_COPY -O $LOCAL_BKO_LOCATION/$FILE_TO_COPY

echo "downloading knoppix initramfs"
FILE_TO_COPY=/D/K/K5/minirt.gz
rm -f $LOCAL_BKO_LOCATION/$FILE_TO_COPY
wget $REMOTE_BKO_LOCATION/$FILE_TO_COPY -O $LOCAL_BKO_LOCATION/$FILE_TO_COPY

echo "downloading knoppix6 initramfs"
FILE_TO_COPY=/D/K/K6/minirt.gz
rm -f $LOCAL_BKO_LOCATION/$FILE_TO_COPY
wget $REMOTE_BKO_LOCATION/$FILE_TO_COPY -O $LOCAL_BKO_LOCATION/$FILE_TO_COPY

echo "downloading fedora initramfs"
FILE_TO_COPY=/D/R/F/initrd0.img 
rm -f $LOCAL_BKO_LOCATION/$FILE_TO_COPY
wget $REMOTE_BKO_LOCATION/$FILE_TO_COPY -O $LOCAL_BKO_LOCATION/$FILE_TO_COPY

echo "downloading debian initramfs"
FILE_TO_COPY=/D/D/DL/initrd1.img
rm -f $LOCAL_BKO_LOCATION/$FILE_TO_COPY
wget $REMOTE_BKO_LOCATION/$FILE_TO_COPY -O $LOCAL_BKO_LOCATION/$FILE_TO_COPY

echo "downloading ubuntu initramfs"
FILE_TO_COPY=/D/U/U9/initrd.gz
rm -f $LOCAL_BKO_LOCATION/$FILE_TO_COPY
wget $REMOTE_BKO_LOCATION/$FILE_TO_COPY -O $LOCAL_BKO_LOCATION/$FILE_TO_COPY

