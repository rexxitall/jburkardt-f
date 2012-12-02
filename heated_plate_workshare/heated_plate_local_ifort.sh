#!/bin/bash
#
#  Compile with IFORT.
#
ifort -openmp -parallel -fpp heated_plate_workshare.f90
#
mv a.out heated_plate
#
#  Request 1 thread.
#
echo "Run with 1 thread."
export OMP_NUM_THREADS=1
./heated_plate > heated_plate_local_ifort_output.txt
#
#  Request 2 threads.
#
echo "Run with 2 threads."
export OMP_NUM_THREADS=2
./heated_plate >> heated_plate_local_ifort_output.txt
#
#  Request 4 threads.
#
echo "Run with 4 threads."
export OMP_NUM_THREADS=4
./heated_plate >> heated_plate_local_ifort_output.txt
#
#  Discard the executable.
#
rm heated_plate
#
echo "Program output written to heated_plate_local_ifort_output.txt"
