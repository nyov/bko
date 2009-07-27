#!/bin/bash
LOCAL_BKO_LOCATION=/home/pravin/Etherboot/git/BKO.git/
REMOTE_BKO_LOCATION=pravin@rom.etherboot.org:/pub/share/pravin/BKO/

echo "uploading dsl initramfs"
FILE_TO_COPY=/pxeknife/dsl/minirt24.gz
scp $LOCAL_BKO_LOCATION/$FILE_TO_COPY $REMOTE_BKO_LOCATION/$FILE_TO_COPY

echo "uploading knoppix initramfs"
FILE_TO_COPY=/pxeknife/knoppix/5.0.1/minirt.gz
scp $LOCAL_BKO_LOCATION/$FILE_TO_COPY $REMOTE_BKO_LOCATION/$FILE_TO_COPY

echo "uploading fedora initramfs"
FILE_TO_COPY=/pxeknife/red_hat/fedora_11_live_cd/initrd0.img 
scp $LOCAL_BKO_LOCATION/$FILE_TO_COPY $REMOTE_BKO_LOCATION/$FILE_TO_COPY

echo "uploading debian initramfs"
FILE_TO_COPY=/pxeknife/debian/debian-live-501-i386/initrd1.img
scp $LOCAL_BKO_LOCATION/$FILE_TO_COPY $REMOTE_BKO_LOCATION/$FILE_TO_COPY

echo "uploading ubuntu initramfs"
FILE_TO_COPY=/pxeknife/ubuntu/ubuntu-9.04-desktop-i386/initrd.gz
scp $LOCAL_BKO_LOCATION/$FILE_TO_COPY $REMOTE_BKO_LOCATION/$FILE_TO_COPY


