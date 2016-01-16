## setwd("/Users/rogerfischer/datamap/geoid/US/example/primary_iowa_2016")
## getwd()

## ATTENTION THIS IS A SIMULATION!!! THIS IS FAKE DATA
## ===================================================


## How to merge external fake result data (FAKE_EXT) with the geoid reference data (REF)
## ===========================================================================

## Use data from 2012 in fake_ext 
fileUrl <- "https://raw.githubusercontent.com/datamapio/geoid/master/US/example/primary_iowa_2012/primary_iowa_county_2012_ext.csv"
download.file(fileUrl, destfile = "fake_ext.csv", method = "curl")


## The REF 2010-2016
## Use "Raw" (=https://raw.githubusercontent.com/...) when downloading the file from Github
## https://github.com/datamapio/geoid/blob/master/US/county/by_state/iowa/iowa_county_2010-2016.csv
fileUrl <- "https://raw.githubusercontent.com/datamapio/geoid/master/US/county/by_state/iowa/iowa_county_2010-2016.csv"
download.file(fileUrl, destfile = "ref.csv", method = "curl")
list.files()

dateDownloaded <- date()
dateDownloaded # "Sat Jan 16 13:49:03 2016"

fake_ext <- read.csv("fake_ext.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE) 
ref <- read.csv("ref.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE, 
                colClasses = c("character", "character", "character", "character", 
                               "character", "character", "character"))
## dim(fake_ext)
## dim(ref)

## Add three columns to fake_ext and rename them
fake_ext$randpaul <- fake_ext$Roemer 
fake_ext$repnopref <- fake_ext$No.Preference 
fake_ext$repother <- fake_ext$Other 
names(fake_ext) <- c("fips", "county", "trump", "cruz", "rubio", "bush", "carson", "christie","fiorina", "gilmore", "huckabee", "kasich",    
                     "santorum", "randpaul", "repnopref", "repother")
## Merge by fips
fake_data <- merge(ref, fake_ext, by="fips")

## Rearrange and delete unnecessary columns
fake_data <- fake_data[c("id", "county_name", "trump", "cruz", "rubio", "bush", "carson", "christie", "fiorina", "gilmore", "huckabee", "kasich", "santorum", "randpaul", "repnopref", "repother")]

## Create new csv file to use in dataviz. ATTENTION: this is FAKE DATA
write.table(fake_data, file="FAKE_primary_rep_iowa_county_2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)
