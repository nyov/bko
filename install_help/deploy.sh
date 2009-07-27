#!/bin/bash
set -e

# pick the configuration information
source ../configure

# all scripts are in install_help folder

./deploy_gpxe.sh

./configure_BKO.sh

# Creating initramfs images needs root password,
# if you have root access and trust the following script then use it
# otherwise use "download_initramfs_images_http.sh" script 
# for downloading pre-compiled initramfs images
#./deploy_BKO.sh # it will ask for root password for creating initramfs images
./download_initramfs_images_http.sh
