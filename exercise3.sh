#!/bin/bash

output="exercise3.txt"
> $output

N=16384
PT=36
for i in 1 2 4 8 16; do
	
	mpirun -np $PT/i omplace -nt i ./poisson $N > $Variabel
	fprintf >> $Variable 
done
