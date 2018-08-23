#!/bin/bash
# https://www.nongnu.org/avr-libc/user-manual/install_tools.html#install_avr_gcc

# Make AVR-GCC
echo "\n*** Making GCC ***\n"

echo "\n\nExtracting ...\n"
tar xf $VER_GCC.tar.xz

echo "\n\nInstalling dependencies ...\n"
mkdir -p $VER_GCC/obj-avr
cd $VER_GCC
sed -i 's/ftp:\/\/gcc\.gnu\.org/http:\/\/gcc\.gnu\.org/' ./contrib/download_prerequisites
./contrib/download_prerequisites

echo "\n\nConfigure ...\n"
cd obj-avr
../configure --prefix="$PREFIX_LINUX" --target=avr --enable-languages=c,c++ --disable-nls --disable-libssp --with-dwarf2 --disable-libada --disable-shared --enable-static > /dev/null

echo "\n\nBuild ...\n"
make -j $JOBCOUNT > /dev/null

echo "\n\nInstall ...\n"
make install > /dev/null

cd ../../
echo ""
