## setwd("/Users/rogerfischer/datamap/geoid/US/example/primary_iowa_2016")
## getwd()

## ATTENTION THIS IS A SIMULATION!!! THIS IS FAKE DATA FOR DEMOCRATS
## =================================================================


## How to merge external fake result data (FAKE_EXT) with the geoid reference data (REF)
## =====================================================================================

## Use data from 2012 in fake_ext2 
fileUrl <- "https://raw.githubusercontent.com/datamapio/geoid/master/US/example/primary_iowa_2012/primary_iowa_county_2012_ext.csv"
download.file(fileUrl, destfile = "fake_ext2.csv", method = "curl")


## The REF 2010-2016
## Use "Raw" (=https://raw.githubusercontent.com/...) when downloading the file from Github
## https://github.com/datamapio/geoid/blob/master/US/county/by_state/iowa/iowa_county_2010-2016.csv
fileUrl <- "https://raw.githubusercontent.com/datamapio/geoid/master/US/county/by_state/iowa/iowa_county_2010-2016.csv"
download.file(fileUrl, destfile = "ref.csv", method = "curl")
list.files()

dateDownloaded <- date()
dateDownloaded # "Tue Jan 19 16:00:20 2016"

fake_ext2 <- read.csv("fake_ext2.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE) 
ref <- read.csv("ref.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE, 
                colClasses = c("character", "character", "character", "character", 
                               "character", "character", "character"))
## dim(fake_ext2)
## dim(ref)

## Delete one column from fake_ext2 and rename them
fake_ext2$Gingrich <- NULL
dim(fake_ext2)
names(fake_ext2) <- c("fips", "county", "warren", "chafee", "sanders", "omalley","clinton", "biden",    
                     "webb", "lessig", "demnopref", "demother")
## Merge by fips
fake_data2 <- merge(ref, fake_ext2, by="fips")

## Rearrange and delete unnecessary columns
fake_data2 <- fake_data2[c("id", "county_name", "warren", "chafee", "sanders", "omalley","clinton", "biden",    
                         "webb", "lessig", "demnopref", "demother")]

## Create new csv file to use in dataviz. ATTENTION: this is FAKE DATA 2
write.table(fake_data2, file="FAKE_primary_dem_iowa_county_2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)

