#!/bin/bash
# https://www.nongnu.org/avr-libc/user-manual/install_tools.html#install_avr_binutils

# Make AVR-Binutils
MYNAME="binutils"
echo "\n*** Making ${MYNAME} ***\n"

echo "\n\nDownloading and extracting ${MYNAME} ...\n"
if [ ! -f "${VER_BINUTILS}/README" ]; then
  wget http://ftp.gnu.org/gnu/binutils/${VER_BINUTILS}.tar.xz &&
  tar xf ${VER_BINUTILS}.tar.xz
fi

echo "\n\nConfigure ${MYNAME} ...\n"
mkdir -p ${VER_BINUTILS}/obj-avr && cd ${VER_BINUTILS}/obj-avr &&
../configure --prefix="$PREFIX" --target=avr --disable-nls > /dev/null &&

echo "\n\nBuild ${MYNAME} ...\n" &&
make -j $JOBCOUNT > /dev/null &&

echo "\n\nInstall ${MYNAME} ...\n" &&
make install > /dev/null &&

cd ../../ &&
echo ""


