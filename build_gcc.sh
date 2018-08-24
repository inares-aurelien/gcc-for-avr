#!/bin/bash
# https://www.nongnu.org/avr-libc/user-manual/install_tools.html#install_avr_gcc
# build the code on --build, run it on --host with --target architecture environment.

# Make AVR-GCC
MYNAME="avr-gcc"
echo "\n*** Making ${MYNAME} ***\n"

echo "\n\nDownloading and extracting ${MYNAME} ...\n"
if [ ! -f "${VER_GCC}/README" ]; then
  wget http://mirror.rit.edu/gnu/gcc/${VER_GCC}/${VER_GCC}.tar.xz > /dev/null &&
  tar xf ${VER_GCC}.tar.xz > /dev/null
fi

echo "\n\nInstalling dependencies for ${MYNAME} ...\n"
mkdir -p ${VER_GCC}/obj-avr && cd ${VER_GCC} &&
sed -i 's/ftp:\/\/gcc\.gnu\.org/http:\/\/gcc\.gnu\.org/' ./contrib/download_prerequisites &&
./contrib/download_prerequisites &&

echo "\n\nConfigure ${MYNAME} ...\n" &&
cd obj-avr &&
../configure --prefix="$PREFIX" --target=avr --host=x86-64 --build=x86-64 --enable-languages=c,c++ --disable-nls --disable-libssp --with-dwarf2 --disable-libada --disable-shared --enable-static > /dev/null &&

echo "\n\nBuild ${MYNAME} ...\n" &&
make -j $JOBCOUNT > /dev/null &&

echo "\n\nInstall ${MYNAME} ...\n" &&
make install > /dev/null &&

cd ../../ &&
echo ""
