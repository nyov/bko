#!/bin/bash
git clone git://git.etherboot.org/scm/people/pravin/BKO.git
cd BKO
git submodule init
git submodule update
echo "Edit the config file to suit your needs"
exit 0

make
cd install_help
./configure_BKO.sh
./download_initramfs_images_http.sh

