#!/bin/bash
#
mkdir temp
cd temp
rm *
~/bin/$ARCH/f90split ../ncc_triangle.f90
#
for FILE in `ls -1 *.f90`;
do
  gfortran -c -g $FILE >& compiler.txt
  if [ $? -ne 0 ]; then
    echo "Errors compiling " $FILE
    exit
  fi
  rm compiler.txt
done
rm *.f90
#
ar qc libncc_triangle.a *.o
rm *.o
#
mv libncc_triangle.a ~/lib/$ARCH
cd ..
rmdir temp
#
echo "Library installed as ~/lib/$ARCH/libncc_triangle.a"
