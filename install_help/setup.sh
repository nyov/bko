#!/bin/bash
git clone git://git.etherboot.org/scm/people/pravin/BKO.git
git submodule init
git submodule update
cd BKO
echo "Edit the config"
exit 0

make
cd install_help
./configure_BKO.sh
./download_initramfs_images_http.sh

