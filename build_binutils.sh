#!/bin/bash
# https://www.nongnu.org/avr-libc/user-manual/install_tools.html#install_avr_binutils

# Make AVR-Binutils
echo -e "\n*** Making Binutils ***\n"

echo -e "\n\nExtracting ...\n"
tar xf $VER_BINUTILS.tar.xz

echo -e "\n\nConfigure ...\n"
mkdir -p $VER_BINUTILS/obj-avr
cd $VER_BINUTILS/obj-avr
../configure --prefix="$PREFIX_LINUX" --target=avr --disable-nls

echo -e "\n\nBuild ...\n"
make -j $JOBCOUNT

echo -e "\n\nInstall ...\n"
make install

cd ../../
echo ""
