## setwd("/Users/rogerfischer/datamap/geoid/US/example/primary_iowa_2016")
## getwd()

## How to merge external result data (EXT) with the geoid reference data (REF)
## ===========================================================================

## The EXT for 2016 
## Currently only a template / you can call any file. Ideally it contains fips, because we merge the REF and EXT on fips 
fileUrl <- "https://raw.githubusercontent.com/datamapio/geoid/master/US/example/primary_iowa_2016/primary_rep_iowa_county_2016_ext.csv"
download.file(fileUrl, destfile = "ext.csv", method = "curl")


## The REF 2010-2016
## Use "Raw" (=https://raw.githubusercontent.com/...) when downloading the file from Github
## https://github.com/datamapio/geoid/blob/master/US/county/by_state/iowa/iowa_county_2010-2016.csv
fileUrl <- "https://raw.githubusercontent.com/datamapio/geoid/master/US/county/by_state/iowa/iowa_county_2010-2016.csv"
download.file(fileUrl, destfile = "ref.csv", method = "curl")
list.files()

dateDownloaded <- date()
dateDownloaded # "Sat Jan 16 14:13:20 2016"

ext <- read.csv("ext.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE)
ref <- read.csv("ref.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE, 
                  colClasses = c("character", "character", "character", "character", 
                                 "character", "character", "character"))

## Merge by fips
data <- merge(ref, ext, by="fips")

## Rearrange and delete unnecessary columns
data <- data[c("id", "county_name", "trump", "cruz", "rubio", "bush", "carson", "christie", "fiorina", "gilmore", "huckabee", "kasich", "santorum", "randpaul", "repnopref", "repother")]

## Create the new CSV file, which has the structure used in the dataviz index file
write.table(data, file="primary_rep_iowa_county_2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)

