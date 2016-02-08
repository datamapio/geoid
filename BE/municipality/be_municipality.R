## setwd("/Users/rogerfischer/datamap/geoid/BE/municipality")
## getwd()

## fileUrl = download URL; destfile = local file name, e.g. ext.xls
fileUrl <- "http://statbel.fgov.be/fr/binaries/INS-code_tcm326-193255.xls"
download.file(fileUrl, destfile = "ext.xls", method = "curl")

## Always document the time of the download as the file content or location might change
dateDownloaded <- date()
dateDownloaded # "Mon Feb  8 11:29:42 2016"

## Install gdata
install.packages("gdata")
library(gdata)
## Read first sheet in as data frame (df). 
## If the Excel has several sheets create ext1 for sheet=1, ext2 for sheet=2 etc.
ext <- read.xls ("ext.xls", sheet = 1, header = FALSE, stringsAsFactors=FALSE)

write.table(ext, file="RAW_belgium_municipality_2013.csv", sep="," ,col.names=TRUE, row.names=FALSE)

Bruxelles: 8:26
Province of Anvers
Arr. Anvers: 33:62
Arr. Malines: 65:77
Arr. Turnhout: 80:106

Province de Brabant Flamande
Arr. Hal-Vilvorde: 111:145
Arr. Louvain: 148:177

Province de Flandre Occidentale
Arr. de Bruges: 31003






ext[, c(8:26, 33:62, ]

