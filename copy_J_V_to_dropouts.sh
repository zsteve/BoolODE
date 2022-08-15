#!/bin/bash

dir=$(pwd)
cd $1


for i in $(ls | grep -E 'dyn-.*-[0-9]$'); do
	for j in $(ls | grep -E $i-); do 
		echo $j
		cp $i/JacobianData.csv $j/
		cp $i/VelocityData.csv $j/
	done
done

cd $dir 


