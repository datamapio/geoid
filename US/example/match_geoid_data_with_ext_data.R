## setwd("/Users/rogerfischer/datamap/geoid/US/example")
## getwd()

## How to merge external result data with the geoid reference data
##≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠

## External Data: 2012 Data from the Guardian
## https://docs.google.com/spreadsheets/d/15_KGSulg72cU2Km8G3ZrZdLSctg_WSoGKiFCgihpTVs/edit#gid=21
## See also: http://www.theguardian.com/news/datablog/2012/jan/05/us-elections-2012-iowa-caucus-results#data
## Imported as csv file: https://github.com/datamapio/geoid/blob/master/US/example/primary_iowa_county_2012.csv
fileUrl <- "https://raw.githubusercontent.com/datamapio/geoid/master/US/example/primary_iowa_county_2012_ext.csv"
download.file(fileUrl, destfile = "ext.csv", method = "curl")

# Geoid reference Data for 2012
# https://github.com/datamapio/geoid/blob/master/US/county/by_state/iowa/iowa_2011-2012.csv
fileUrl <- "https://raw.githubusercontent.com/datamapio/geoid/master/US/county/by_state/iowa/iowa_county_2011-2012.csv"
download.file(fileUrl, destfile = "geoid.csv", method = "curl")
list.files()

dateDownloaded <- date()
dateDownloaded # "Mon Jan 11 11:14:22 2016"

ext <- read.csv("ext.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE)
geoid <- read.csv("geoid.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE, 
                  colClasses = c("character", "character", "character", "character", 
                                 "character", "character", "character"))

## head(ext)
## head(geoid)
## str(ext)
## str(geoid)
## dim(ext)
## dim(geoid)

# Merge by fips
data <- merge(geoid, ext, by="fips")

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

## Merging geoid and ext2 on county_fips
## data2 <- merge(geoid, ext2, by="county_fips")

## Rearranging and deleting unimportant data
## data2 <- data2[c("id", "county_name", "Bachmann", "Gingrich", "Huntsman", "Paul", "Perry", "Romney", "Santorum")]
## data2 <- data2[order(data2$id),] # if you have to order data


## head(data)
## tail(data)

# Rearrange and delete unnecessary columns
# Bachmann Cain Gingrich Huntsman Paul Perry Roemer Romney Santorum No.Preference Other (Candidates in alphabetical order)
data$no_preference <- data$No.Preference
data$other <- data$Other
data <- data <- data[c("id", "county_name", "Bachmann", "Cain", "Gingrich", "Huntsman", "Paul", "Perry", "Roemer", "Romney", "Santorum", "no_preference", "other")]

write.table(data, file="primary_iowa_county_2012.csv", sep="," ,col.names=TRUE, row.names=FALSE)