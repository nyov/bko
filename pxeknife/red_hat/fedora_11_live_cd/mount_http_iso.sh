#!/static/sh

# objectives: 
# Enable networking.
# Setup networking.
# Find the location from which we need to get the ISO.
# Mount the ISO.

echo "HTTP Boot: inserting network modules"
#insmod /modules/crc32c.ko   
insmod /modules/8390.ko   
insmod /modules/mii.ko   
insmod /modules/ne2k-pci.ko   
insmod /modules/pcnet32.ko   
insmod /modules/r8169.ko   
insmod /modules/e100.ko   
insmod /modules/e1000.ko  
insmod /modules/sis900.ko   
insmod /modules/via-rhine.ko   
insmod /modules/8139too.ko   
#insmod /modules/af_packet.ko >/dev/null 2>&1 
#insmod /modules/loop.ko >/dev/null 2>&1 

ifconfig lo 127.0.0.1 up
ifconfig eth0 up
udhcpc -s /static/udhcpc.sh  >/dev/null 2>&1 

ISO_PATH=$1
echo "The location of fedora.iso is $ISO_PATH"
echo "mounting CDROM"
mkdir /iso
httpfs $ISO_PATH /iso
FILEPATH=`ls /iso/*.iso`
busybox mount -t iso9660 $FILEPATH /sysroot -o loop -o ro


# test if knoppix is there
if test -f /sysroot/LiveOS/squashfs.img
then
echo -n "successfully mounted the Image"
return 0
fi
return 1
