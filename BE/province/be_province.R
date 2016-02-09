## setwd("/Users/rogerfischer/datamap/geoid/BE/province")
## getwd()

## fileUrl = download URL; destfile = local file name, e.g. ext.xls
## fileUrl <- "http://statbel.fgov.be/fr/binaries/INS-code_tcm326-193255.xls"
## download.file(fileUrl, destfile = "ext.xls", method = "curl")

## Always document the time of the download as the file content or location might change
## dateDownloaded <- date()
## dateDownloaded # "Mon Feb  8 11:29:42 2016"

## Install gdata
## install.packages("gdata")
## library(gdata)
## Read first sheet in as data frame (df). 
## If the Excel has several sheets create ext1 for sheet=1, ext2 for sheet=2 etc.
## ext <- read.xls ("ext.xls", sheet = 1, header = FALSE, stringsAsFactors=FALSE)

## Local copy
ext <- read.xls("../municipality/ext.xls", sheet = 1, header = FALSE, stringsAsFactors=FALSE)


## PROVINCE
ext_prov_v <- grepl(pattern = "Province", x = ext$V1)
ext_province <- ext[ext_prov_v, ] # Liege is missing again
liege_province <- ext[grepl(60000, ext$V2), ]
ext_province <- rbind(ext_province, liege_province)
ext_province <- ext_province[order(ext_province$V2), ]
write.table(ext_province, file="RAW_belgium_province_2013.csv", sep="," ,col.names=TRUE, row.names=FALSE)


