#!/bin/bash
LOCAL_BKO_LOCATION=/home/pravin/Etherboot/git/BKO/
REMOTE_BKO_LOCATION=pravin@rom.etherboot.org:/pub/share/pravin/BKO/

echo "uploading dsl initramfs"
FILE_TO_COPY=/D/dsl/minirt24.gz
scp $LOCAL_BKO_LOCATION/$FILE_TO_COPY $REMOTE_BKO_LOCATION/$FILE_TO_COPY

echo "uploading knoppix initramfs"
FILE_TO_COPY=/D/K/K5/minirt.gz
scp $LOCAL_BKO_LOCATION/$FILE_TO_COPY $REMOTE_BKO_LOCATION/$FILE_TO_COPY

echo "uploading knoppix6 initramfs"
FILE_TO_COPY=/D/K/K6/minirt.gz
scp $LOCAL_BKO_LOCATION/$FILE_TO_COPY $REMOTE_BKO_LOCATION/$FILE_TO_COPY

echo "uploading fedora initramfs"
FILE_TO_COPY=/D/R/F/initrd0.img 
scp $LOCAL_BKO_LOCATION/$FILE_TO_COPY $REMOTE_BKO_LOCATION/$FILE_TO_COPY

echo "uploading debian initramfs"
FILE_TO_COPY=/D/D/DL/initrd1.img
scp $LOCAL_BKO_LOCATION/$FILE_TO_COPY $REMOTE_BKO_LOCATION/$FILE_TO_COPY

echo "uploading ubuntu initramfs"
FILE_TO_COPY=/D/U/U9/initrd.gz
scp $LOCAL_BKO_LOCATION/$FILE_TO_COPY $REMOTE_BKO_LOCATION/$FILE_TO_COPY


