#!/bin/sh

# objectives: 
# Enable networking.
# Setup networking.
# Find the location from which we need to get the ISO.
# Mount the ISO.

echo "HTTP Boot: inserting network modules"
insmod /modules/8390.ko >/dev/null 2>&1  
insmod /modules/mii.ko >/dev/null 2>&1 
insmod /modules/ne2k-pci.ko >/dev/null 2>&1 
insmod /modules/pcnet32.ko >/dev/null 2>&1 
insmod /modules/r8169.ko >/dev/null 2>&1 
insmod /modules/e100.ko >/dev/null 2>&1 
insmod /modules/e1000.ko >/dev/null 2>&1 
insmod /modules/sis900.ko >/dev/null 2>&1 
insmod /modules/via-rhine.ko >/dev/null 2>&1 
insmod /modules/8139too.ko >/dev/null 2>&1 
insmod /modules/fuse.ko >/dev/null 2>&1 

ifconfig lo 127.0.0.1 up
ifconfig eth0 up
udhcpc -s /bin/udhcpc.sh  >/dev/null 2>&1 

ISO_PATH=$1
echo "The location of fedora.iso is $ISO_PATH"
echo "mounting CDROM"
mkdir /iso
httpfs $ISO_PATH /iso
FILEPATH=`ls /iso/*.iso`
mount -t iso9660 $FILEPATH /sysroot -o loop -o ro


# test if knoppix is there
if test -f /sysroot/LiveOS/squashfs.img
then
    echo -n "successfully mounted the Image"
    exit 0
fi
exit 1
