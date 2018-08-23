#!/bin/bash
# https://www.nongnu.org/avr-libc/user-manual/install_tools.html#install_avr_libc

# Make AVR-LibC
echo -e "\n\x1b[38;5;214m*** Making AVR-LibC ***\x1b[0m\n"

echo -e "\n\n\x1b[33mExtracting ...\n"
tar xjf $VER_LIBC.tar.bz2

echo -e "\n\n\x1b[33mConfigure ...\x1b[0m\n"
cd $VER_LIBC
./configure --prefix="$PREFIX_LIBC" --build=`./config.guess` --host=avr

echo -e "\n\n\x1b[33mBuild ...\x1b[0m\n"
make -j $JOBCOUNT

echo -e "\n\n\x1b[33mInstall ...\x1b[0m\n"
make install

cd ../
echo ""
