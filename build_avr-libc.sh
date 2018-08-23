#!/bin/bash
# https://www.nongnu.org/avr-libc/user-manual/install_tools.html#install_avr_libc

# Make AVR-LibC
echo -e "\n*** Making AVR-LibC ***\n"

echo -e "\n\nExtracting ...\n"
tar xjf $VER_LIBC.tar.bz2

echo -e "\n\nConfigure ...\n"
cd $VER_LIBC
./configure --prefix="$PREFIX_LIBC" --build=`./config.guess` --host=avr

echo -e "\n\nBuild ...\n"
make -j $JOBCOUNT

echo -e "\n\nInstall ...\n"
make install

cd ../
echo ""
