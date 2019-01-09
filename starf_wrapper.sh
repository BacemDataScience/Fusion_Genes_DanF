#!/bin/bash

OUT=/pghbio/dbmi/Genomics_Core/rmh55/Dan_Faden/SN0145541

for filename in /pghbio/dbmi/Genomics_Core/rmh55/Dan_Faden/SN0145541/RevertedFastq/*r1.fastq; do
        read1=$filename
        read2=${read1%????????}
        read2=$read2"r2.fastq"
        name=${read1%?????????}
        name=$(basename $name)
        name=$OUT/$name"_results"
        echo $name
        sbatch starfusion.job $read1 $read2 $name
done
