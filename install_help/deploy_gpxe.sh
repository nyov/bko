#!/bin/bash
set -e
source ../bko/configure


# all scripts are in install_help folder
cd ..

gpxePATH=$GPXE_GIT_LOCATION
BOOT_PATH=$BOOT_URL
BKOPATH=`pwd`

echo "Compiling gpxe..."
cd $gpxePATH/src
echo "Generating custom script files"
cp pxeDHCP.conf pxeDHCP.gpxe
cp pxeSTATIC.conf pxeSTATIC.gpxe

./custom_make.sh
echo "removing old gpxe images..."
cd $BKOPATH
rm -rf ./gpxe_images
mkdir -p ./gpxe_images

echo "copying gpxe images..."
cp $gpxePATH/src/bin/gpxe.dsk ./gpxe_images/
cp $gpxePATH/src/bin/gpxe.usb ./gpxe_images/
cp $gpxePATH/src/bin/gpxe.iso ./gpxe_images/
cp $gpxePATH/src/bin/gpxe.lkrn ./gpxe_images/
