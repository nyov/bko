#!/bin/bash
LOCAL_BKO_LOCATION=/var/www/BKO/
REMOTE_BKO_LOCATION=pravin@rom.etherboot.org:/pub/share/pravin/BKO/

echo "uploading debian initramfs"
FILE_TO_COPY=/bko/live/debian/initmod/initrd1.img
scp $LOCAL_BKO_LOCATION/$FILE_TO_COPY $REMOTE_BKO_LOCATION/$FILE_TO_COPY

echo "uploading ubuntu-9.10 initramfs"
FILE_TO_COPY=/bko/live/ubuntu/U9.10/initrd.lz
scp $LOCAL_BKO_LOCATION/$FILE_TO_COPY $REMOTE_BKO_LOCATION/$FILE_TO_COPY

echo "uploading ubuntu-9.04 initramfs"
FILE_TO_COPY=/bko/live/ubuntu/U9/initrd.gz
scp $LOCAL_BKO_LOCATION/$FILE_TO_COPY $REMOTE_BKO_LOCATION/$FILE_TO_COPY

echo "uploading dsl initramfs"
FILE_TO_COPY=/bko/live/dsl/minirt24.gz
scp $LOCAL_BKO_LOCATION/$FILE_TO_COPY $REMOTE_BKO_LOCATION/$FILE_TO_COPY

echo "uploading knoppix initramfs"
FILE_TO_COPY=/bko/live/knoppix/5.11/minirt.gz
scp $LOCAL_BKO_LOCATION/$FILE_TO_COPY $REMOTE_BKO_LOCATION/$FILE_TO_COPY

echo "uploading knoppix6 initramfs"
FILE_TO_COPY=/bko/live/knoppix/6.0.1/minirt.gz
scp $LOCAL_BKO_LOCATION/$FILE_TO_COPY $REMOTE_BKO_LOCATION/$FILE_TO_COPY

echo "uploading fedora initramfs"
FILE_TO_COPY=/bko/live/fedora/f11/initrd0.img 
scp $LOCAL_BKO_LOCATION/$FILE_TO_COPY $REMOTE_BKO_LOCATION/$FILE_TO_COPY

