#!/bin/bash
#SBATCH --job-name="scgrn-undir"
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=4G
#SBATCH --partition=mig
#SBATCH --time=0-03:00:00
#SBATCH --array=1-125
#SBATCH --output=%x-%A_%a.out

parameters=`sed -n "${SLURM_ARRAY_TASK_ID} p" params_undir`
parameterArray=($parameters)

eps=${parameterArray[0]}
lamda1=${parameterArray[1]}
lamda2=${parameterArray[2]}

suffix=$eps"_"$lamda1"_"$lamda2
srcpath="/data/gpfs/projects/punim0638/stephenz/sc-causal-grn/src"
datapath=__DATAPATH__

ml load julia 
mkdir $datapath/infer_undir_output"_"$suffix
julia $srcpath/infer.jl --X $datapath/X.npy --X_pca $datapath/X_pca.npy --C $datapath/C.npy --eps $eps --lambda1 $lamda1 --lambda2 $lamda2 --outdir $datapath/infer_undir_output"_"$suffix/

