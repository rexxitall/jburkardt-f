#!/bin/bash
#
gfortran -c -g sparsekit_prb14.f90 >& compiler.txt
if [ $? -ne 0 ]; then
  echo "Errors compiling sparsekit_prb14.f90"
  exit
fi
rm compiler.txt
#
gfortran sparsekit_prb14.o -L$HOME/lib/$ARCH -lsparsekit
if [ $? -ne 0 ]; then
  echo "Errors linking and loading sparsekit_prb14.o"
  exit
fi
rm sparsekit_prb14.o
#
mv a.out sparsekit_prb14
./sparsekit_prb14 > sparsekit_prb14_output.txt
if [ $? -ne 0 ]; then
  echo "Errors running sparsekit_prb14"
  exit
fi
rm sparsekit_prb14
#
echo "Program output written to sparsekit_prb14_output.txt"
