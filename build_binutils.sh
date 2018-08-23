#!/bin/bash
# https://www.nongnu.org/avr-libc/user-manual/install_tools.html#install_avr_binutils

# Make AVR-Binutils
echo -e "\n\x1b[38;5;214m*** Making Binutils ***\x1b[0m\n"

echo -e "\n\n\x1b[33mExtracting ...\n"
tar xf $VER_BINUTILS.tar.xz

echo -e "\n\n\x1b[33mConfigure ...\x1b[0m\n"
mkdir -p $VER_BINUTILS/obj-avr
cd $VER_BINUTILS/obj-avr
../configure --prefix="$PREFIX_LINUX" --target=avr --disable-nls

echo -e "\n\n\x1b[33mBuild ...\x1b[0m\n"
make -j $JOBCOUNT

echo -e "\n\n\x1b[33mInstall ...\x1b[0m\n"
make install

cd ../../
echo ""
