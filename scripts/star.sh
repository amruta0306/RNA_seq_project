#!/bin/bash

#SBATCH --time=48:00:00   # walltime limit (HH:MM:SS)
#SBATCH -p short
#SBATCH --nodes=1   # number of nodes
#SBATCH --ntasks-per-node=40   # 16 processor core(s) per node
#SBATCH --mail-user=amruta03@iastate.edu   # email address
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

#SBATCH --job-name='star'

module load star
STAR --runMode genomeGenerate --runThreadN 16 --genomeDir ref/ --genomeFastaFiles Zm-B73-REFERENCE-NAM-5.0.fa --sjdbGTFfile Zm.B73.gtf --sjdbOverhang 99
