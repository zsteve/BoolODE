#!/bin/bash
#SBATCH --job-name="cespgrn"
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=4G
#SBATCH --partition=mig
#SBATCH --time=0-03:00:00
#SBATCH --array=1-125
#SBATCH --output=%x-%A_%a.out

parameters=`sed -n "${SLURM_ARRAY_TASK_ID} p" params_cespgrn`
parameterArray=($parameters)

k=${parameterArray[0]}
bandwidth=${parameterArray[1]}
lamda=${parameterArray[2]}

suffix=$k"_"$bandwidth"_"$lamda
srcpath="/data/gpfs/projects/punim0638/stephenz/sc-causal-grn/src"
datapath=__DATAPATH__

ml load python/3.8.6
mkdir $datapath/cespgrn_output"_"$suffix
python $srcpath/cespgrn.py --cespgrnpath /home/stephenz/stephenz/CeSpGRN/src --X $datapath/X.npy --X_pca $datapath/X_pca.npy --k $k --bandwidth $bandwidth --lamda $lamda --outdir $datapath/cespgrn_output"_"$suffix/
