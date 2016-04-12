#!/bin/bash

output="output.txt"
> $output

N=128
P=2
for i in 1 4 8; do
	mpirun -np $P ./poisson $N > $Variabel
	fprintf >> $Variable 
done

