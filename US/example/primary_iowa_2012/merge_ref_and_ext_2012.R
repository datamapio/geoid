## setwd("/Users/rogerfischer/datamap/geoid/US/example")
## getwd()

## How to merge external result data (EXT) with the geoid reference data (REF)
## ===========================================================================

## External Data: 2012 Data from the Guardian
## https://docs.google.com/spreadsheets/d/15_KGSulg72cU2Km8G3ZrZdLSctg_WSoGKiFCgihpTVs/edit#gid=21
## See also: http://www.theguardian.com/news/datablog/2012/jan/05/us-elections-2012-iowa-caucus-results#data
## Imported as csv file: https://github.com/datamapio/geoid/blob/master/US/example/primary_iowa_county_2012.csv
fileUrl <- "https://raw.githubusercontent.com/datamapio/geoid/master/US/example/primary_iowa_county_2012_ext.csv"
download.file(fileUrl, destfile = "ext.csv", method = "curl")

## The REF for 2012
## https://github.com/datamapio/geoid/blob/master/US/county/by_state/iowa/iowa_county_2010-2015.csv
fileUrl <- "https://raw.githubusercontent.com/datamapio/geoid/master/US/county/by_state/iowa/iowa_county_2010-2015.csv"
download.file(fileUrl, destfile = "ref.csv", method = "curl")
list.files()

dateDownloaded <- date()
dateDownloaded # "Mon Jan 11 11:14:22 2016"

ext <- read.csv("ext.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE)
ref <- read.csv("ref.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE, 
                  colClasses = c("character", "character", "character", "character", 
                                 "character", "character", "character"))

## head(ext)
## head(ref)
## str(ext)
## str(ref)
## dim(ext)
## dim(ref)

# Merge by fips
data <- merge(ref, ext, by="fips")

## Special Case: Merge on county_fips when ext2 FIPS data has no leading zeros 
## (e.g. 1 for Adair County instead of 001)
##
## Data on page, scrapped from the Guardian 
## http://www.theguardian.com/news/datablog/2012/jan/05/us-elections-2012-iowa-caucus-results#data
## ext2 <- read.csv("ext2.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE)
## library(dplyr)
## ext2 <- slice(ext2, 1:99) # totals and source needs to go
## str(ext2)
##
## See stringr for str_pad: https://cran.r-project.org/web/packages/stringr/vignettes/stringr.html
## library(stringr)
## Add a new variable county_fips to ext2 with leading zeros
## ext2$county_fips <- str_pad(ext2$FIPS.Code, width=3, pad = "0")

## Merging ref and ext2 on county_fips
## data2 <- merge(ref, ext2, by="county_fips")

## Rearranging and deleting unimportant data
## data2$bachmann <- data2$Bachmann  
## data2$gingrich	<- data2$Gingrich
## data2$huntsman	<- data2$Huntsman
## data2$paul	<- data2$Paul
## data2$perry <- data2$Perry
## data2$romney	<- data2$Romney
## data2$santorum <- data2$Santorum

## data2 <- data2[c("id", "county_name", "bachmann", "gingrich", "huntsman", "paul", "perry", "romney", "santorum")]
## data2 <- data2[order(data2$id),] # if you have to order the data
## write.table(data2, file="primary_iowa_county_2012_data2.csv", sep="," ,col.names=TRUE, row.names=FALSE)


## head(data)
## tail(data)

# Rearrange and delete unnecessary columns
# Bachmann Cain Gingrich Huntsman Paul Perry Roemer Romney Santorum No.Preference Other (Candidates in alphabetical order)
data$no_preference <- data$No.Preference
data$other <- data$Other
data$bachmann <- data$Bachmann  
data$cain	<- data$Cain
data$gingrich	<- data$Gingrich
data$huntsman	<- data$Huntsman
data$paul	<- data$Paul
data$perry <- data$Perry
data$roemer	<- data$Roemer
data$romney	<- data$Romney
data$santorum <- data$Santorum

data <- data[c("id", "county_name", "bachmann", "cain", "gingrich", "huntsman", "paul", "perry", "roemer", "romney", "santorum", "no_preference", "other")]

write.table(data, file="primary_iowa_county_2012.csv", sep="," ,col.names=TRUE, row.names=FALSE)