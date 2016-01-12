## setwd("/Users/rogerfischer/datamap/geoid/special_cases")
## getwd()

## How to merge external result data (EXT) with the geoid reference data (REF)
## ===========================================================================

## The EXT for 2012 Data from the Guardian
## http://www.theguardian.com/news/datablog/2012/nov/07/us-2012-election-county-results-download#data
## Imported as xlsx file: http://image.guardian.co.uk/sys-files/Guardian/documents/2012/11/14/US_elect_county.xls
fileUrl <- "http://image.guardian.co.uk/sys-files/Guardian/documents/2012/11/14/US_elect_county.xls"
download.file(fileUrl, destfile = "ext.xls", method = "curl")

## The REF for 2012
## https://github.com/datamapio/geoid/blob/master/US/county/us_county_congressionalvote_2012.csv
fileUrl <- "https://raw.githubusercontent.com/datamapio/geoid/master/US/county/us_county_congressionalvote_2012.csv"
download.file(fileUrl, destfile = "ref.csv", method = "curl")
list.files()

dateDownloaded <- date()
dateDownloaded # "Tue Jan 12 15:17:15 2016"

install.packages("gdata")
require(gdata)
ext <- read.xls ("ext.xls", sheet = 1, header = TRUE, stringsAsFactors=FALSE)
ref <- read.csv("ref.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE, 
                colClasses = c("character", "character", "character", "character", 
                               "character", "character", "character"))
## Uups!
str(ext) # 4074 obs. of  7 variables
str(ref) # 3143 obs. of  7 variables

## Let's figure out how many counties per state are in the EXT file:
group_by_state_code <- group_by(ext, State.Postal)
county_by_state_ext <- summarize(group_by_state_code, count = n())
write.table(county_by_state_ext, file="us_county_by_state_ext.csv", sep="," ,col.names=TRUE, row.names=FALSE)

