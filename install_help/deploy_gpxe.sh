#!/bin/bash
set -e
source ../configure


# all scripts are in install_help folder
cd ..

gpxePATH=$GPXE_GIT_LOCATION
BOOT_PATH=$BOOT_URL
BKOPATH=`pwd`

echo "Compiling gpxe..."
cd $gpxePATH/src
echo "Generating custom script files"
cp pxeDHCP.bko.tmpl pxeDHCP.gpxe
cp pxeSTATIC.bko.tmpl pxeSTATIC.gpxe
regular_expression=`echo "s/P_BOOT_URL/$BOOT_PATH/g"`
perl -p -i -e "$regular_expression" pxeDHCP.gpxe 
perl -p -i -e "$regular_expression" pxeSTATIC.gpxe 


./custom_make.sh
echo "removing old gpxe images..."
cd $BKOPATH
rm -rf ./gpxe_images
mkdir ./gpxe_images

echo "copying gpxe images..."
cp $gpxePATH/src/bin/gpxe.dsk ./gpxe_images/
cp $gpxePATH/src/bin/gpxe.usb ./gpxe_images/
cp $gpxePATH/src/bin/gpxe.iso ./gpxe_images/
cp $gpxePATH/src/bin/gpxe.lkrn ./gpxe_images/
