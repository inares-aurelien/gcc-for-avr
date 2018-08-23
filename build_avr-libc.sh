#!/bin/bash
# https://www.nongnu.org/avr-libc/user-manual/install_tools.html#install_avr_libc

# Make AVR-LibC
echo "\n*** Making AVR-LibC ***\n"

echo  "\n\nExtracting ...\n"
tar xjf $VER_LIBC.tar.bz2

echo "\n\nConfigure ...\n"
cd $VER_LIBC
./configure --prefix="$PREFIX_LIBC" --build=`./config.guess` --host=avr

echo "\n\nBuild ...\n"
make -j $JOBCOUNT > /dev/null

echo "\n\nInstall ...\n"
make install

cd ../
echo ""
