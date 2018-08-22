#!/bin/bash

confMake()
{
  ../configure --prefix=$1 $2 $3 $4
  make -j $JOBCOUNT
  make install-strip
  rm -rf *
}

# Make AVR-GCC
echo "*** Making GCC ***"
echo "Extracting ..."
tar xf $NAME_GCC.tar.xz
mkdir -p $NAME_GCC/obj-avr
cd $NAME_GCC
echo "Installing dependencies ..."
./contrib/download_prerequisites
cd obj-avr
echo "confMake ..."
confMake "$PREFIX_LINUX" "$OPTS_GCC"
cd ../../

echo ""