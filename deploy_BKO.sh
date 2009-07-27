#!/bin/bash
set -e

cd pxeknife
echo "Creating customized initrd image for DSL .."
cd dsl/
./generate_minirt24.sh
cd ..

echo "Creating customized initrd image for KNOPPIX .."
cd knoppix/5.0.1/
./generate_minirt.sh
cd ../..

echo "Creating customized initrd image for debian .."
cd debian/debian-live-501-i386/
./generate_initrd.sh
cd ../..

echo "Creating customized initrd image for Ubuntu .."
cd ubuntu/ubuntu-9.04-desktop-i386/
./generate_initrd.sh
cd ../..

echo "Creating customized initrd image for red hat .."
cd red_hat/fedora_11_live_cd/
./generate_initrd.sh
cd ../..

cd ..
echo "Done with image generation phase"
