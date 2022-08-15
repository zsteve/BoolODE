#!/bin/bash
epsvals=(0.5 1 2.5 5 10)
lamda1vals=(1 2.5 5 10 25)
lamda2vals=(0 0.001 0.005 0.01 0.025)
for eps in ${epsvals[@]}; do 
	for lamda1 in ${lamda1vals[@]}; do
		for lamda2 in ${lamda2vals[@]}; do
			echo "$eps $lamda1 $lamda2"
		done
	done
done
