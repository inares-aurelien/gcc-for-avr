#!/bin/bash
# https://www.nongnu.org/avr-libc/user-manual/install_tools.html#install_avr_libc

# Make AVR-LibC
MYNAME="AVR-LibC"
echo "\n*** Making ${MYNAME} ***\n"

# Handle cache
#define __AVR_LIBC_VERSION_STRING__ "2.0.0"
VER_LIBC_ESCAPED=$(echo "${VER_LIBC}" | sed 's/\./\\\./g')
RES_SED=$(sed -n '/__AVR_LIBC_VERSION_STRING__.*"${VER_LIBC_ESCAPED}"/p' ${PREFIX}/include/avr/version.h.in)
if [ -n "$RES_SED" ] ; then
  echo "${MYNAME} is already OK for version ${VER_LIBC} --> We will do nothing"
  exit 0
fi

echo "\n\nDownloading and extracting ${MYNAME} ...\n"
wget http://download.savannah.gnu.org/releases/avr-libc/${AVR_LIBC}.tar.bz2 &&
tar xjf ${AVR_LIBC}.tar.bz2 &&

echo "\n\nConfigure ${MYNAME} ...\n" &&
cd ${AVR_LIBC} &&
CC="$PREFIX/avr-gcc" CXX="$PREFIX/avr-g++" ./configure --prefix="$PREFIX" --build=`./config.guess` --host=avr --disable-doc --quiet &&

echo "\n\nBuild ${MYNAME} ...\n" &&
make -j $JOBCOUNT > /dev/null &&
make check &&

echo "\n\nInstall ${MYNAME} ...\n" &&
make install > /dev/null &&

cd ../ &&
echo ""
