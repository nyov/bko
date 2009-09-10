#!/bin/sh

# objectives: 
# Enable networking.
# Setup networking.
# Find the location from which we need to get the ISO.
# Mount the ISO.


CMDLINE="$(cat /proc/cmdline)"
case "$CMDLINE" in *httpfs=*) HTTPFS="$httpfs"; ;; esac
case "$CMDLINE" in *ip=*) 
IPP=`cat /proc/cmdline | sed 's/ /\n/g' | grep "ip=*" | cut -d'=' -f2`; ;; esac

echo "http url is $HTTPFS and IPP value is $IPP"
echo "The output of actual command.. "
cat /proc/cmdline | sed 's/ /\n/g' | grep "ip=*" | cut -d'=' -f2

echo "HTTP Boot: inserting network modules"
insmod /modules/8390.ko  >/dev/null 2>&1 
insmod /modules/mii.ko  >/dev/null 2>&1 
insmod /modules/ne2k-pci.ko  >/dev/null 2>&1 
insmod /modules/pcnet32.ko  >/dev/null 2>&1 
insmod /modules/r8169.ko  >/dev/null 2>&1 
insmod /modules/e100.ko  >/dev/null 2>&1 
insmod /modules/e1000.ko  >/dev/null 2>&1 
insmod /modules/e1000e.ko  >/dev/null 2>&1 
insmod /modules/sis900.ko  >/dev/null 2>&1 
insmod /modules/via-rhine.ko  >/dev/null 2>&1 
insmod /modules/8139too.ko  >/dev/null 2>&1 
insmod /modules/cloop.ko >/dev/null 2>&1 

ifconfig lo 127.0.0.1 up
ifconfig eth0 up
myip=`echo $IPP | cut -d: -f1`
echo "Using ip address $myip"
mynm=`echo $IPP | cut -d: -f4`
echo "Using Netmask $mynm"
mygw=`echo $IPP | cut -d: -f3`
echo "Using gateway ip $mygw"
ifconfig eth0 $myip netmask $mynm 2> /output
echo "verify the ip address"
ifconfig eth0

echo "nameserver 4.2.2.2
nameserver 128.255.1.3" > /etc/resolv.conf
 
echo "setting route"
route add default gw $mygw 2> /outputroute



ISO_PATH=$HTTPFS
echo "The location of iso is $ISO_PATH"
echo "mounting CDROM"
mkdir /iso
httpfs $ISO_PATH /iso
FILEPATH=`ls /iso/*.iso`
busybox mount -t iso9660 $FILEPATH /mnt-system -o loop -o ro

# test if knoppix is there
if test -f /mnt-system/KNOPPIX
then
echo -n "successfully mounted the Image"
fi

