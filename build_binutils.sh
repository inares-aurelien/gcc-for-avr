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

echo ""