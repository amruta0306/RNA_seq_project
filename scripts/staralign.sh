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
#
#B73_R1_anther_MN01081_R1.fq  B73_R1_anther_MN01082_R2.fq  B73_V18_ear_MN01072_R1.fq      HP301_R1_anther_MN12081_R2.fq  HP301_V18_ear_MN12071_R1.fq  HP301_V18_ear_MN12072_R2.fq  sta#ralign.sh
#B73_R1_anther_MN01081_R2.fq  B73_V18_ear_MN01071_R1.fq    B73_V18_ear_MN01072_R2.fq      HP301_R1_anther_MN12082_R1.fq  HP301_V18_ear_MN12071_R2.fq  mapped
#B73_R1_anther_MN01082_R1.fq  B73_V18_ear_MN01071_R2.fq    HP301_R1_anther_MN12081_R1.fq  HP301_R1_anther_MN12082_R2.fq  HP301_V18_ear_MN12072_R1.fq  slurm-7833024.out

#module load star
#for file in *.fq; do STAR --runMode alignReads --runThreadN 12 --genomeDir ../ref/ --outSAMtype BAM SortedByCoordinate --readFilesIn ${file} --outFileNamePrefix ../mapped/${file}; done


module load star

for GENOTYPE in B73_R1_anther_MN01081 B73_R1_anther_MN01082 B73_V18_ear_MN01071 B73_V18_ear_MN01072 HP301_R1_anther_MN12081 HP301_R1_anther_MN12082 HP301_V18_ear_MN12071 HP301_V18_ear_MN12072;
do
	STAR --runMode alignReads --runThreadN 12 --genomeDir ../ref/ --outSAMtype BAM SortedByCoordinate --readFilesIn ${GENOTYPE}_R1.fq ${GENOTYPE}_R2.fq --outFileNamePrefix ../mapped/${GENOTYPE}
done

#STAR --runMode alignReads --runThreadN 12 --genomeDir ../ref/ --outSAMtype BAM SortedByCoordinate --readFilesIn B73_R1_anther_MN01081_R1.fq,B73_R1_anther_MN01082_R1.fq,

