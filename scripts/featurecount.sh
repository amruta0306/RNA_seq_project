#!/bin/bash

#SBATCH --time=48:00:00   # walltime limit (HH:MM:SS)
#SBATCH -p short
#SBATCH --nodes=1   # number of nodes
#SBATCH --ntasks-per-node=40   # 16 processor core(s) per node
#SBATCH --mail-user=amruta03@iastate.edu   # email address
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

#SBATCH --job-name='featurecount'
module load subread
featureCounts -T 16 bam/*.bam -p -a Zm.B73.gtf -o count.out
