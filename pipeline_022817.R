#!/usr/bin/env Rscript

suppressPackageStartupMessages(library("optparse"))
suppressPackageStartupMessages(library(affy))

option_list <- list(
  make_option(c("-d", "--dataset"), type="character", help="dataset")
  )
opt <- parse_args(OptionParser(option_list=option_list))

file<-opt$dataset

z <- readLines(file)
a <- 0
for (line in z){
results <- read.table(line,header = T)
pmc <- matrix(results$posterior_mean_count)

if (a > 0){
x <- cbind(x,pmc)
exp <- ExpressionSet(assayData = x)
}else{
x <- pmc
}
a <- a + 1
saveRDS(exp,"PMC_022817.rds")
}
