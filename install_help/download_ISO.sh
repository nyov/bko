#!/bin/bash
set -e
cd ../..
mkdir ISO
cd ISO

wget http://rom.etherboot.org/share/pravin/ISO/dsl.iso
wget http://rom.etherboot.org/share/pravin/ISO/f11.iso
wget http://rom.etherboot.org/share/pravin/ISO/K5.iso
wget http://rom.etherboot.org/share/pravin/ISO/d5.iso
wget http://rom.etherboot.org/share/pravin/ISO/filesystem.squashfs


wget http://rom.etherboot.org/share/pravin/ISO/u9.iso
mkdir U
cd U
wget http://rom.etherboot.org/share/pravin/ISO/U/filesystem.squashfs
cd ..
echo "Downloading is done"
