#!/bin/bash
DIR_CUR=$(pwd)
for i in $(ls | grep "dyn-BF$"); do 
	for j in $(ls $i | grep "2500-[1-9]$"); do
	# for j in $(ls $i | grep "1000-[1-9]-.*" | grep -v coarse); do
		DIR="$(pwd)/$i/$j"
		echo "Preprocessing $DIR"
		python ~/stephenz/sc-causal-grn/data_benchmarking/preprocess.py $DIR
		# cp run*.sh $DIR/
		# cp params* $DIR/
		# sed -i "s~__DATAPATH__~$DIR~g" $DIR/run.sh
		# sed -i "s~__DATAPATH__~$DIR~g" $DIR/run_cespgrn.sh
		# # sed -i "s~__DATAPATH__~$DIR~g" $DIR/run_undir.sh
		# sbatch $DIR/run.sh
		# sbatch $DIR/run_cespgrn.sh
		# sbatch $DIR/run_undir.sh
		# Cleanup
		# cd $DIR
		# rm -r *_output_*
		# cd $DIR_CUR
	done
done
