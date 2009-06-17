#!/static/sh

# objectives: 
# Enable networking.
# Setup networking.
# Find the location from which we need to get the ISO.
# Mount the ISO.

echo "HTTP Boot: inserting network modules"
insmod /modules/crc32.o >/dev/null 2>&1  
insmod /modules/8390.o  >/dev/null 2>&1 
insmod /modules/mii.o  >/dev/null 2>&1 
insmod /modules/ne2k-pci.o  >/dev/null 2>&1 
insmod /modules/pcnet32.o  >/dev/null 2>&1 
insmod /modules/r8169.o  >/dev/null 2>&1 
insmod /modules/e100.o  >/dev/null 2>&1 
insmod /modules/e1000.o  >/dev/null 2>&1 
insmod /modules/sis900.o  >/dev/null 2>&1 
insmod /modules/via-rhine.o  >/dev/null 2>&1 
insmod /modules/8139too.o  >/dev/null 2>&1 
insmod /modules/af_packet.o >/dev/null 2>&1 
insmod /modules/loop.o >/dev/null 2>&1 

ifconfig lo 127.0.0.1 up
ifconfig eth0 up
udhcpc -s /static/udhcpc.sh  >/dev/null 2>&1 
insmod /modules/fuse.o >/dev/null 2>&1 

ISO_PATH=$1
echo "The location of dsl.iso is $ISO_PATH"
echo "mounting CDROM"
mkdir /iso
httpfs $ISO_PATH /iso
busybox mount -t iso9660 /iso/dsl.iso /cdrom -o loop -o ro


# test if knoppix is there
if test -f /cdrom/$KNOPPIX_DIR/$KNOPPIX_NAME
then
echo -n "successfully mounted the Image"
fi

