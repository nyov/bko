#!/bin/bash
set -e

# pick the configuration information
source ../config

# all scripts are in install_help folder
cd ../bko/live


echo "Creating customized initrd image for DSL .."
cd dsl/
./generate_minirt24.sh
cd ..

echo "Creating customized initrd image for KNOPPIX .."
cd knoppix/5.11/
./generate_minirt.sh
cd ../6.0.1/
sudo ./generate_initrd.sh
cd ../..


echo "Creating customized initrd image for debian .."
cd debian/initmod/ 
./generate_initrd.sh
cd ../..

echo "Creating customized initrd image for Ubuntu .."
cd ubuntu/U9/
./generate_initrd.sh
cd ../..

echo "Creating customized initrd image for red hat .."
cd fedora/f11/
./generate_initrd.sh
cd ../..

cd ..
echo "Done with image generation phase"
