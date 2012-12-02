#!/bin/bash
#
ar x $HOME/lib/$ARCH/libcubpack.a precision_model.mod
ar x $HOME/lib/$ARCH/libcubpack.a cui.mod
#
gfortran -c -g ex_decuhr3d.f90 >& compiler.txt
if [ $? -ne 0 ]; then
  echo "Errors compiling ex_decuhr3d.f90"
  exit
fi
rm compiler.txt
#
rm *.mod
#
gfortran ex_decuhr3d.o -L$HOME/lib/$ARCH -lcubpack
if [ $? -ne 0 ]; then
  echo "Errors linking and loading ex_decuhr3d.o"
  exit
fi
rm ex_decuhr3d.o
#
mv a.out ex_decuhr3d
./ex_decuhr3d > ex_decuhr3d.out
if [ $? -ne 0 ]; then
  echo "Errors running ex_decuhr3d"
  exit
fi
rm ex_decuhr3d
#
echo "The ex_decuhr3d test problem has been executed."
