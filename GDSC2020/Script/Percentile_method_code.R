################################################
#Percentile Method
#Created by Bernard Lee, 11 July 2017
################################################

#Set the environment
setwd("~/Documents/JitKang/Working_Copy/GDSC_v2_R_WC/From_JK/AUC/")
workDir <- "~/Documents/JitKang/Working_Copy/GDSC_v2_R_WC/From_JK/AUC"
outDir <- "_percentile_Metods_output/fifth_percentile"
outDir1 <- "_percentile_Metods_output/ninty_fifth_percentile"
dir.create(outDir)
dir.create(outDir1)

#List the files available in the working directory
fileList <- list.files(file.path(workDir), pattern = "*.txt", full.names = T)
fileList

#Running example
#Oxozeaenol <- read.delim("(5Z)-7-Oxozeaenol.txt", header = T)
#Oxozeaenol <- Oxozeaenol[order(Oxozeaenol[,2]), ]
#head(Oxozeaenol)
#Q <- quantile(Oxozeaenol[,2], c(0.05,0.95))
#Q
#fifth_percentile <- subset(Oxozeaenol, Oxozeaenol[,2] < Q[1])
#write.table(fifth_percentile, "_percentile_Metods_output/fifth_percentile/Oxozeaenol.txt", sep='\t', quote = F, row.names = F)

#Use for loop --> for 5th percentile
for(i in seq_along(fileList)){
  #Basename of the files
  BN <- basename(fileList)
  #Read the file in a loop
  dat <- read.delim(fileList[i], header = T)
  dat <- dat[order(dat[,2]), ]
  Q <- quantile(dat[,2], c(0.05,0.95))
  fifth_percentile <- subset(dat, dat[,2] < Q[1])
  write.table(fifth_percentile, file.path(outDir, BN[i]), quote=F, sep='\t', row.names = F)
}

#Use for loop --> for 95th percentile
for(i in seq_along(fileList)){
  #Basename of the files
  BN <- basename(fileList)
  #Read the file in a loop
  dat <- read.delim(fileList[i], header = T)
  dat <- dat[order(dat[,2]), ]
  Q <- quantile(dat[,2], c(0.05,0.95))
  ninty_fifth_percentile <- subset(dat, dat[,2] > Q[2])
  write.table(ninty_fifth_percentile, file.path(outDir1, BN[i]), quote=F, sep='\t', row.names = F)
}

#########################################################################################################
info <- sessionInfo()
info
