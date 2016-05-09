#!/bin/bash

#PBS -N poissonExe
#PBS -A ntnu603
#PBS -l walltime=00:45:00
#PBS -l select=2:ncpus=32:mpiprocs=16:ompthreads=16

#PBS -o stdoutJob1ExeV2
#PBS -e stderrJob1ExeV2
#PBS -m abe
#PBS -M raymont@stud.ntnu.no

cd $PBS_O_WORKDIR
module load mpt
module load intelcomp
module load cmake

cmake .. -DCMAKE_BUILD_TYPE=Release
make
echo "Result from Job with combinations of N, P and T: "> jobResult1_V2.txt
for N in 128 512 2048 8192 16384; do
	for P in 1 2 4 8 16 32; do
		for T in 1 2 4 8 16;do
			echo "N=$N, P=$P,T=$T ">>jobResult1.txt
			mpirun -np $P omplace -nt $T ./poisson $N >>jobResult1_V2.txt
		done
	done
done
