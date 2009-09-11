#!/bin/bash
cd ..
cd syslinux
echo "Compiling syslinux.."
make > make_logs.txt 2>&1
if [ -z ./syslinux/core/pxelinux.0 ] || [ -z ./syslinux/com32/menu/menu.c32 ] || [ -z ./syslinux/com32/menu/vesamenu.c32 ]
then
	echo "Problems in builing needed files in syslinux"
	echo "please refer "syslinux/make_logs.txt" for problems."
fi
cd ../bko
echo "Creating needed symbolic links"
ln -s ../syslinux/core/pxelinux.0 pxelinux.0
ln -s ../syslinux/com32/menu/menu.c32 menu.c32
ln -s ../syslinux/com32/menu/vesamenu.c32 vesamenu.c32
echo "Done with syslinux deployment.."
