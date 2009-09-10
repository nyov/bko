#!/static/sh

# objectives: 
# Enable networking.
# Setup networking.
# Find the location from which we need to get the ISO.
# Mount the ISO.

echo "nameserver 4.2.2.2
nameserver 128.255.1.3" > /etc/resolv.conf


echo "HTTP Boot: inserting network modules"
insmod /modules/crc32c.ko >/dev/null 2>&1  
insmod /modules/8390.ko  >/dev/null 2>&1 
insmod /modules/mii.ko  >/dev/null 2>&1 
insmod /modules/ne2k-pci.ko  >/dev/null 2>&1 
insmod /modules/pcnet32.ko  >/dev/null 2>&1 
insmod /modules/r8169.ko  >/dev/null 2>&1 
insmod /modules/e100.ko  >/dev/null 2>&1 
insmod /modules/e1000.ko  >/dev/null 2>&1 
insmod /modules/sis900.ko  >/dev/null 2>&1 
insmod /modules/via-rhine.ko  >/dev/null 2>&1 
insmod /modules/8139too.ko  >/dev/null 2>&1 
insmod /modules/af_packet.ko >/dev/null 2>&1 
insmod /modules/loop.ko >/dev/null 2>&1 

ifconfig lo 127.0.0.1 up
ifconfig eth0 up
myip=`echo $ip | cut -d: -f1`
echo "Using ip address $myip"
mynm=`echo $ip | cut -d: -f4`
echo "Using Netmask $mynm"
mygw=`echo $ip | cut -d: -f3`
echo "Using gateway ip $mygw"
ifconfig eth0 $myip netmask $mynm 2> /output
echo "verify the ip address"
ifconfig eth0


echo "setting route"
route add default gw $mygw 2> /outputroute


ISO_PATH=$1
echo "The location of dsl.iso is $ISO_PATH"
echo "mounting CDROM"
mkdir /iso
httpfs $ISO_PATH /iso
FILEPATH=`ls /iso/*.iso`
busybox mount -t iso9660 $FILEPATH /cdrom -o loop -o ro


# test if knoppix is there
if test -f /cdrom/$KNOPPIX_DIR/$KNOPPIX_NAME
then
echo -n "successfully mounted the Image"
fi

