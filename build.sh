#!/bin/bash

confMake()
{
  ../configure --prefix=$1 $2 $3 $4
  make -j $JOBCOUNT
  make install-strip
  rm -rf *
}

# Make AVR-Binutils
echo "Making Binutils..."
echo "Extracting..."
tar xf $NAME_BINUTILS.tar.xz
mkdir -p $NAME_BINUTILS/obj-avr
cd $NAME_BINUTILS/obj-avr
confMake "$PREFIX_LINUX" "$OPTS_BINUTILS"
cd ../../

# Make AVR-GCC
echo "Making GCC..."
echo "Extracting..."
tar xf $NAME_GCC.tar.xz
mkdir -p $NAME_GCC/obj-avr
cd $NAME_GCC
./contrib/download_prerequisites
cd obj-avr
# fixGCCAVR
confMake "$PREFIX_LINUX" "$OPTS_GCC"
cd ../../

# Make AVR-LibC
echo "Making AVR-LibC..."
echo "Extracting..."
bunzip2 -c $NAME_LIBC.tar.bz2 | tar xf -
mkdir -p $NAME_LIBC/obj-avr
cd $NAME_LIBC/obj-avr
confMake "$PREFIX_LIBC" "$OPTS_LIBC" --host=avr --build=`../config.guess`
cd ../../

echo ""

