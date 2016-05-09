#!/bin/bash

module load mpt
module load intelcomp
module load cmake

C=mpicc FC=mpif90 cmake .. -DCMAKE_BUILD_TYPE=Release

echo "Done compiling"
