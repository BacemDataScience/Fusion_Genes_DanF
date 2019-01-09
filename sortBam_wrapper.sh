#!/bin/bash

# Sort BAM file
for filename in /pghbio/dbmi/Genomics_Core/rmh55/Dan_Faden/SN0145541/BAMs/*.bam ; do
        echo $(basename $filename)
        sbatch sortBam.job $filename
done
