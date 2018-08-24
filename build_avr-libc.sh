#!/bin/bash
# https://www.nongnu.org/avr-libc/user-manual/install_tools.html#install_avr_libc

# Make AVR-LibC
MYNAME="avr-libc"
echo "\n*** Making ${MYNAME} ***\n"

echo "\n\nDownloading and extracting ${MYNAME} ...\n"
if [ ! -f "${VER_LIBC}/README" ]; then
  wget http://download.savannah.gnu.org/releases/avr-libc/${VER_LIBC}.tar.bz2 &&
  tar xjf ${VER_LIBC}.tar.bz2
fi

echo "\n\nConfigure ${MYNAME} ...\n"
cd ${VER_LIBC} &&
./configure --prefix="$PREFIX" --build=`./config.guess` --host=avr > /dev/null &&

echo "\n\nBuild ${MYNAME} ...\n" &&
make -j $JOBCOUNT > /dev/null &&

echo "\n\nInstall ${MYNAME} ...\n" &&
make install > /dev/null &&

cd ../ &&
echo ""
