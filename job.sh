#!/bin/bash

# PBS -N poisson
# PBS -A ntnu603
# PBS -l walltime=00:02:00
# PBS -l select=2:ncpus=32:mpiprocs=16:ompthreads=16

#PBS -o stdout
#PBS -e stderr
#PBS -m abe
#PBS -M raymont@stud.ntnu.no

cd $PBS_O_WORKDIR
cd Build
module load mpt
module load intelcomp

bash exercise3.sh

