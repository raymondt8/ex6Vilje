#!/bin/bash

#PBS -N poisson0
#PBS -A ntnu603
#PBS -l walltime=00:00:10
#PBS -l select=1:ncpus=16:mpiprocs=16:ompthreads=2

#PBS -o stdoutJob
#PBS -e stderrJob
#PBS -m abe
#PBS -M raymont@stud.ntnu.no

cd $PBS_O_WORKDIR
module load mpt
module load intelcomp
module load cmake

cmake .. -DCMAKE_BUILD_TYPE=Release
make
echo "Result from Job with combinations of N, P and T: "> jobResult0.txt
N=2048
P=16
T=2
echo "N=$N, P=$P,T=$T ">>jobResult1.txt
mpirun -np $P omplace -nt $T ./poisson $N >>jobResult0.txt
