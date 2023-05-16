#!/bin/bash
## Job Name
#SBATCH --job-name=assign4
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
#SBATCH --chdir=/gscratch/scrubbed/stanja/assign_04

# for rsync
# run the following in the Rterminal, while connected to mox:
# rsync -avz assignments/code/04-* stanja@mox.hyak.uw.edu:/gscratch/scrubbed/stanja/assign_04

# for scp
# run the following in the Rterminal, while connected to mox:
# scp assignments/code/04-* stanja@mox.hyak.uw.edu:/gscratch/scrubbed/stanja/assign_04

# type the following to schedule the job
# sbatch 04-job-sh

# Then on mox, inside the assign_04 directory you will type”

# sbatch 04-job-sh to schedule the job.

# Once done you should have a couple of new files in the directory.

# You will want to check them to see if everything worked and then move the output back to your repo…

# rsync -avz stanja@mox.hyak.uw.edu:/gscratch/scrubbed/stanja/assign_04/ 

#run a python script you wrote!
module load intel-python3_2017

python 04-hello.py

# run blastx just to get manual
/gscratch/srlab/programs/ncbi-blast-2.10.1+/bin/blastx -help

#a few bash commands
pwd 

whoami

echo "yeah! I did it!!!!!!!!!!"

#this writes out  tofile
echo "yeah! I did it!!!!!!!!!!" > text.file