#!/bin/bash
kvals=(5 25 50 100 250)
bwvals=(0.05 0.1 0.25 0.5 1.0)
lamdavals=(0.005 0.01 0.025 0.05 0.1)
for k in ${kvals[@]}; do 
	for bw in ${bwvals[@]}; do
		for lamda in ${lamdavals[@]}; do
			echo "$k $bw $lamda"
		done
	done
done
