#!/bin/bash
set -e

# pick the configuration information
source ../bko/configure

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
./generate_minirt.sh
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
