#!/bin/bash

confMake()
{
  ../configure --prefix=$1 $2 $3 $4
  make -j $JOBCOUNT
  make install-strip
  rm -rf *
}

# Make AVR-LibC
echo "Making AVR-LibC..."
echo "Extracting..."
bunzip2 -c $NAME_LIBC.tar.bz2 | tar xf -
mkdir -p $NAME_LIBC/obj-avr
cd $NAME_LIBC/obj-avr
confMake "$PREFIX_LIBC" "$OPTS_LIBC" --host=avr --build=`../config.guess`
cd ../../

echo ""

