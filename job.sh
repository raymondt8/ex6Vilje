#!/bin/bash

#PBS -N poisson
#PBS -A ntnu603
#PBS -l walltime=00:30:00
#PBS -l select=2:ncpus=32:mpiprocs=16:ompthreads=16

#PBS -o stdout
#PBS -e stderr
#PBS -m abe
#PBS -M raymont@stud.ntnu.no

cd $PBS_O_WORKDIR
cd build
module load mpt
module load intelcomp

output="poisson.txt"
>$output

for N in 128 512 2048 8192 16384 do
	for P in 1 2 4 8 16 32 do
		for T in 1 2 4 8 16 do
			mpirun -np P omplace T ./poisson N >$variable
			fprintf >> $variable
		done
	done
done

