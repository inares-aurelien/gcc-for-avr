#!/bin/bash
# https://www.nongnu.org/avr-libc/user-manual/install_tools.html#install_avr_libc

# Make AVR-LibC
MYNAME="AVR-LibC"
echo "\n*** Making ${MYNAME} ***\n"

#define __AVR_LIBC_VERSION_STRING__ "2.0.0"
VER_LIBC_ESCAPED="$(sed 's/\./\\\./g' <<< "${VER_LIBC}")"
RES_SED=$(sed '/__AVR_LIBC_VERSION_STRING__.*"${VER_LIBC_ESCAPED}"/p' ${PREFIX}/include/avr/version.h.in)
if [ ! -z "$RES_SED" ] ;
  echo "${MYNAME} is already OK for version ${VER_LIBC} --> We will do nothing"
  exit 0
fi

echo "\n\nDownloading and extracting ${MYNAME} ...\n"
wget http://download.savannah.gnu.org/releases/avr-libc/${AVR_LIBC}.tar.bz2 &&
tar xjf ${AVR_LIBC}.tar.bz2

echo "\n\nConfigure ${MYNAME} ...\n"
cd ${AVR_LIBC} &&
./configure --prefix="$PREFIX" --build=`./config.guess` --host=avr --quiet &&

echo "\n\nBuild ${MYNAME} ...\n" &&
make -j $JOBCOUNT > /dev/null &&
make check &&

echo "\n\nInstall ${MYNAME} ...\n" &&
make install > /dev/null &&

cd ../ &&
echo ""
