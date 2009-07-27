#!/bin/bash
set -e
cd ../..
mkdir ISO
cd ISO

wget http://rom.etherboot.org/share/pravin/ISO/dsl.iso
wget http://rom.etherboot.org/share/pravin/ISO/Fedora-11-i686-Live.iso
wget http://rom.etherboot.org/share/pravin/ISO/KNOPPIX_V5.1.1CD-2007-01-04-EN.iso
wget http://rom.etherboot.org/share/pravin/ISO/debian-live-501-i386-gnome-desktop.iso
wget http://rom.etherboot.org/share/pravin/ISO/filesystem.squashfs


wget http://rom.etherboot.org/share/pravin/ISO/ubuntu-9.04-desktop-i386.iso
mkdir U
cd U
wget http://rom.etherboot.org/share/pravin/ISO/U/filesystem.squashfs
cd ..
echo "Downloading is done"
