#!/bin/bash
git clone git://github.com/nyov/bko.git
cd BKO
git submodule init
git submodule update
echo "Edit the config file to suit your needs"
exit 0

make
cd install_help
./configure_BKO.sh
./download_initramfs_images_http.sh

