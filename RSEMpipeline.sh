#!/bin/bash -l

source ~/.bashrc
module load R/3.3.2

genesresultsfile='pmc2.txt'
isoformsresultsfile='pmc.txt'

demographicsfile='demo.txt'
inputfile='/restricted/projectnb/pcga/Exome_Seq/Scripts/NextFlow/RNA/fastq_input.txt'
fastqfile='/restricted/projectnb/pcga/Exome_Seq/Scripts/NextFlow/RNA/Summary/Fastq/fastq_multiqc_data/multiqc_fastqc.txt'
picardmarkedduplicatesfile='/restricted/projectnb/pcga/Exome_Seq/Scripts/NextFlow/RNA/Summary/Library/library_multiqc_data/multiqc_picard_dups.txt'
rseqcbamstatfile='/restricted/projectnb/pcga/Exome_Seq/Scripts/NextFlow/RNA/Summary/Sample/sample_multiqc_data/multiqc_rseqc_bam_stat.txt'
multiqcgeneralstatsfile='/restricted/projectnb/pcga/Exome_Seq/Scripts/NextFlow/RNA/Summary/Sample/sample_multiqc_data/multiqc_general_stats.txt'
multiqcinferexpfile='/restricted/projectnb/pcga/Exome_Seq/Scripts/NextFlow/RNA/Summary/Sample/sample_multiqc_data/multiqc_rseqc_infer_experiment.txt'
rseqcjunctionannfile='/restricted/projectnb/pcga/Exome_Seq/Scripts/NextFlow/RNA/Summary/Sample/sample_multiqc_data/multiqc_rseqc_junction_annotation.txt'
rseqcreaddistfile='/restricted/projectnb/pcga/Exome_Seq/Scripts/NextFlow/RNA/Summary/Sample/sample_multiqc_data/multiqc_rseqc_read_distribution.txt'
gtffile='/restricted/projectnb/cbmhive/references/RSEM/ucsc/hg19/Ensembl/Homo_sapiens.GRCh37.75/base_random/Homo_sapiens.GRCh37.75.ucsc.base_random.gtf'

##mkdir -p logs
##NAME="pipeline"
##LOG="logs/0307.log"

##qsub -V -P pulmseq -l h_rt=24:00:00 -N $NAME -o $LOG -j y -cwd 
Rscript RSEM_pipeline.R -a $genesresultsfile -b $isoformsresultsfile -c $demographicsfile -d $inputfile -e $fastqfile -f $picardmarkedduplicatesfile -g $rseqcbamstatfile -z $multiqcgeneralstatsfile -i $multiqcinferexpfile -x $rseqcjunctionannfile -k $rseqcreaddistfile -n $gtffile




