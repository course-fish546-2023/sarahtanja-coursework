#!/bin/bash
## blast
#SBATCH --job-name=blast
## Allocation Definition
#SBATCH --account=srlab
#SBATCH --partition=srlab
## Resources
## Nodes
#SBATCH --nodes=1
## Walltime (days-hours:minutes:seconds format)
#SBATCH --time=01-08:00:00
## Memory per node
#SBATCH --mem=100G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=stanja@uw.edu
## Specify the working directory for this job
#SBATCH --chdir=/gscratch/scrubbed/stanja/blast

#run a python script you wrote!
module load intel-python3_2017

python 04-hello.py

# run blastx just to get manual
/gscratch/srlab/programs/ncbi-blast-2.10.1+/bin/blastx \

#a few bash commands
pwd 

whoami

echo "yah! I did it!!!!!!!!!!"

#this writes out  tofile
echo "yah! I did it!!!!!!!!!!" > text.file