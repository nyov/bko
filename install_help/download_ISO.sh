#!/bin/bash
set -e
cd ../..
mkdir ISO
cd ISO

wget http://mirrors.rit.edu/BKOISO/dsl.iso
wget http://mirrors.rit.edu/BKOISO/f11.iso
wget http://mirrors.rit.edu/BKOISO/K5.iso
wget http://mirrors.rit.edu/BKOISO/d5.iso
wget http://mirrors.rit.edu/BKOISO/filesystem.squashfs


wget http://mirrors.rit.edu/BKOISO/u9.iso
mkdir U
cd U
wget http://mirrors.rit.edu/BKOISO/U/filesystem.squashfs
cd ..
echo "Downloading is done"
