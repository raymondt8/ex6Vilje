#!/bin/bash

#PBS -N poisson
#PBS -A ntnu603
#PBS -l walltime=00:10:00
#PBS -l select=2:ncpus=32:mpiprocs=16:ompthreads=16

#PBS -o stdoutJob
#PBS -e stderrJob
#PBS -m abe
#PBS -M raymont@stud.ntnu.no

cd $PBS_O_WORKDIR
cd build
module load mpt
module load intelcomp

output="exercise3.txt"
> $output
N=16384
PT=36
	
	mpirun -np 32 omplace 1  ./poisson $N > $Variabel
	fprintf >> $Variable 

	mpirun -np 16 omplace 2  ./poisson $N > $Variabel
	fprintf >> $Variable 

	mpirun -np 8 omplace 4  ./poisson $N > $Variabel
	fprintf >> $Variable 

	mpirun -np 4 omplace 8  ./poisson $N > $Variabel
	fprintf >> $Variable 

	mpirun -np 2 omplace 16  ./poisson $N > $Variabel
	fprintf >> $Variable 


