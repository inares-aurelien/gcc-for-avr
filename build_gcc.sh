#!/bin/bash
# https://www.nongnu.org/avr-libc/user-manual/install_tools.html#install_avr_gcc

# Make AVR-GCC
echo -e "\n\x1b[38;5;214m*** Making GCC ***\x1b[0m\n"

echo -e "\n\n\x1b[33mExtracting ...\n"
tar xf $VER_GCC.tar.xz

echo "\x1b[33mInstalling dependencies ...\x1b[0m\n"
mkdir -p $VER_GCC/obj-avr
cd $VER_GCC
sed -i 's/ftp:\/\/gcc\.gnu\.org/http:\/\/gcc\.gnu\.org/' ./contrib/download_prerequisites
./contrib/download_prerequisites

echo -e "\n\n\x1b[33mConfigure ...\x1b[0m\n"
cd obj-avr
../configure --prefix="$PREFIX_LINUX" --target=avr --enable-languages=c,c++ --disable-nls --disable-libssp --with-dwarf2 --disable-libada --disable-shared --enable-static > /dev/null

echo -e "\n\n\x1b[33mBuild ...\x1b[0m\n"
make -j $JOBCOUNT

echo -e "\n\n\x1b[33mInstall ...\x1b[0m\n"
make install

cd ../../
echo ""
