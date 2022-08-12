#!/bin/bash
lamda1vals=(1 2.5 5 10 25)
lamda2vals=(0 0.001 0.005 0.01 0.025)
for k in 1 2 3; do 
	for lamda1 in ${lamda1vals[@]}; do
		for lamda2 in ${lamda2vals[@]}; do
			echo "$k $lamda1 $lamda2"
		done
	done
done
