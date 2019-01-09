## Goal ##
Identify promising gene fusion leads using paired end RNA-Seq data provided by the lab of Dan Faden. 
## Compute Resources ##
All analysis was conducted on the University of Pittsburgh Supercomputer's HTC cluster.
## Dataset ##
We received a total of 50 samples
  * 8 paired end reverse strand samples (SN0145541)
    PATH: /pghbio/dbmi/Genomics_Core/rmh55/Dan_Faden/ SN0145541/
  * 42 paired end reverse strand samples (SN0148531)
    PATH: /pghbio/dbmi/Genomics_Core/rmh55/Dan_Faden/SN0148531/
## Quality Control ##
FASTQC was run on all input files. Quality of the reads suffered due to Formalin-Fixed Paraffin-Embedded (FFPE) preservation of the majority of the tissues.
## Conversion to FASTQ ##
STAR-Fusion requires, as input, either FASTQ file(s) OR a BAM file in addition to a junction file provided by STAR alignment. Because the junction files were not provided to us, the BAM files we received required conversion to FASTQ format. The workflow is as follows.
1.	The BAM files were first re-sorted from read coordinate to read name to better suit conversion. (Samtools version 1.7).
>samtools sort filename
2.	The resorted BAM files were then each converted to two FASTQ files, each containing opposite ends of a set of paired reads. (PicardTools version 2.17.0).
> $PICARD_HOME/picard.jar SamToFastq filename
## Running STAR-Fusion ##
STAR-Fusion version 1.3.1 was then run on the paired end FASTQ files of all 50 samples. The alignment and fusion detection algorithms utilized a reference genome library based on GRCh37_v19 provided at the link below.
https://data.broadinstitute.org/Trinity/CTAT_RESOURCE_LIB/
## Exclusion Criteria ##
Reported fusions are typically excluded if they satisfy any of the following:
* Fusion containese uncharacterized genes, immunoglobulin genes, or mitochondrial genes were excluded
*	Fusion contains paralogous genes
*	The fusion has been reported in normal tissue samples
*	FFPM < 0.1  

Our results still contain fusions that do not pass the exclusion criteria. Promising fusion leads are highlighted in their results file.

## Results ##
The most probable fusion event occurred in samples 33042 and 33120 and is the fusion of FGFR3--TACC3. Both samples had over 100 reads supporting the fusion. Additionally, this is a previously reported oncogenic fusion event.  
Other promising fusion events are reported in...
*	33075 (E2F1--ZNF341)
*	33209 (SLC25A38—MYRIP)
*	33285 (CANX--RTN4IP1)

