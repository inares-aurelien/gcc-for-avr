#!/bin/bash
# https://www.nongnu.org/avr-libc/user-manual/install_tools.html#install_avr_binutils

# Make AVR-Binutils
echo "\n*** Making Binutils ***\n"

echo "\n\nExtracting ...\n"
tar xf $VER_BINUTILS.tar.xz

echo "\n\nConfigure ...\n"
mkdir -p $VER_BINUTILS/obj-avr
cd $VER_BINUTILS/obj-avr
../configure --prefix="$PREFIX_LINUX" --target=avr --disable-nls > /dev/null

echo "\n\nBuild ...\n"
make -j $JOBCOUNT > /dev/null

echo "\n\nInstall ...\n"
make install > /dev/null

cd ../../
echo ""
