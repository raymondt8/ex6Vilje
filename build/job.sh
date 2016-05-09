#!/bin/bash

#PBS -N poisson
#PBS -A ntnu603
#PBS -l walltime=00:45:00
#PBS -l select=2:ncpus=32:mpiprocs=16:ompthreads=16

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
echo "Result from Job with combinations of N, P and T: "> jobResult1.txt
for N in 128 512 2048 8192 16384; do
	for P in 1 2 4 8 16 32; do
		for T in 1 2 4 8 16;do
			echo "N=$N, P=$P,T=$T ">>jobResult1.txt
			mpirun -np $P omplace -nt $T ./poisson $N >>jobResult1.txt
		done
	done
done
