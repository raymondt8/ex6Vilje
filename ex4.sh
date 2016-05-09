
#!/bin/bash

output="ex2.sh"
>$output
$P=16
$T=1
for N in 128 512 2048 8192 do
	mpirun -np $P omplace $T ./poisson N > $Variabel
	fprintf >> $Variable 
done
