#!/bin/bash -l

source ~/.bashrc

while read line;
do
	Rscript pipeline_022817x.R -d $line
done<pms.txt

