#!/bin/bash
# https://www.nongnu.org/avr-libc/user-manual/install_tools.html#install_avr_gcc

# Make AVR-GCC
echo -e "\n*** Making GCC ***\n"

echo -e "\n\nExtracting ...\n"
tar xf $VER_GCC.tar.xz

echo "\n\nInstalling dependencies ...\n"
mkdir -p $VER_GCC/obj-avr
cd $VER_GCC
sed -i 's/ftp:\/\/gcc\.gnu\.org/http:\/\/gcc\.gnu\.org/' ./contrib/download_prerequisites
./contrib/download_prerequisites

echo -e "\n\nConfigure ...\n"
cd obj-avr
../configure --prefix="$PREFIX_LINUX" --target=avr --enable-languages=c,c++ --disable-nls --disable-libssp --with-dwarf2 --disable-libada --disable-shared --enable-static > /dev/null

echo -e "\n\nBuild ...\n"
make -j $JOBCOUNT

echo -e "\n\nInstall ...\n"
make install

cd ../../
echo ""
