## setwd("/Users/rogerfischer/datamap/geoid/KE")
## getwd()

## fileUrl = download URL; destfile = local file name, e.g. ext.xls
## fileUrl <- "http://statistics.knbs.or.ke/nada/index.php/catalog/55/download/377"
## download.file(fileUrl, destfile = "ext.xls", method = "curl")

## Always document the time of the download as the file content or location might change
## dateDownloaded <- date()
## dateDownloaded # "Mon Feb  8 18:28:28 2016"

## Install gdata
## install.packages("gdata")
## library(gdata)
## Read first sheet in as data frame (df). 
## If the Excel has several sheets create ext1 for sheet=1, ext2 for sheet=2 etc.
## ext <- read.xls ("ext.xls", sheet = 1, header = FALSE, stringsAsFactors=FALSE)
