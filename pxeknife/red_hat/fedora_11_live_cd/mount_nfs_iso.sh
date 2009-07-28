#!/bin/sh

# objectives: 
# Enable networking.
# Setup networking.
# Find the location from which we need to get the ISO.
# Mount the ISO.

echo "nameserver 208.67.222.222" > /etc/resolv.conf

echo "NFS Boot: inserting network modules"
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
tempIP=$1


myip=`echo $tempIP | cut -d: -f1`
echo "Using ip address $myip"
mynm=`echo $tempIP | cut -d: -f4`
echo "Using Netmask $mynm"
mygw=`echo $tempIP | cut -d: -f3`
echo "Using gateway ip $mygw"
ifconfig eth0 $myip netmask $mynm 2> /output
echo "verify the ip address"
ifconfig eth0

insmod /modules/sunrpc.ko
insmod /modules/lockd.ko
insmod /modules/auth_rpcgss.ko
insmod /modules/nfs_acl.ko
insmod /modules/nfs.ko

echo "setting route"
route add default gw $mygw 2> /outputroute

NFS_PATH=$2
echo "The NFS mount location is $NFS_PATH"
echo "mounting NFS"

# mounting ISO
mkdir /iso
echo "nfs mounting $NFS_PATH /iso"
mount "$NFS_PATH" /iso -o nolock
FILEPATH="/iso/Fedora-11-i686-Live.iso"
mount -t iso9660 $FILEPATH /sysroot -o loop -o ro
echo "FILEPATH is $FILEPATH and URL is $ISO_PATH"


# mounting the squashfs directly
# mount "$NFS_PATH" /sysroot -o nolock

# test if fedora is there
if test -f /sysroot/LiveOS/squashfs.img
then
    echo -n "successfully mounted the Image"
    exit 0
fi
exit 1
