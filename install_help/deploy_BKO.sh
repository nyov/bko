#!/bin/bash
set -e

# pick the configuration information
source ../configure

# all scripts are in install_help folder
cd ..

cd D 
echo "Creating customized initrd image for DSL .."
cd dsl/
./generate_minirt24.sh
cd ..

echo "Creating customized initrd image for KNOPPIX .."
cd K/K5/
./generate_minirt.sh
cd ../..

echo "Creating customized initrd image for debian .."
cd D/DL/
./generate_initrd.sh
cd ../..

echo "Creating customized initrd image for Ubuntu .."
cd U/U9/
./generate_initrd.sh
cd ../..

echo "Creating customized initrd image for red hat .."
cd R/F/
./generate_initrd.sh
cd ../..

cd ..
echo "Done with image generation phase"
