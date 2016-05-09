#!/bin/bash

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


