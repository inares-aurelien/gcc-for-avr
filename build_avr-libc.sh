#!/bin/bash
# https://www.nongnu.org/avr-libc/user-manual/install_tools.html#install_avr_libc

# Make AVR-LibC
echo "\n*** Making AVR-LibC ***"

echo "Extracting ..."
tar xjf $NAME_LIBC.tar.bz2
cd $NAME_LIBC

echo -e "\n\nConfigure ..."
./configure --prefix="$PREFIX_LIBC" --build=`./config.guess` --host=avr "$OPTS_LIBC"

echo -e "\n\nMake ..."
make -j $JOBCOUNT
make install

cd ../
echo ""

