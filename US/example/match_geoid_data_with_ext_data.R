## setwd("/Users/rogerfischer/datamap/geoid/US/example")
## getwd()

## 2012 Data 
## See also: https://docs.google.com/spreadsheets/d/15_KGSulg72cU2Km8G3ZrZdLSctg_WSoGKiFCgihpTVs/edit#gid=21
fileUrl <- "http://www2.census.gov/geo/docs/reference/codes/files/national_county.txt"
download.file(fileUrl, destfile = "data.txt", method = "curl")
list.files()

dateDownloaded <- date()
dateDownloaded # "Thu Jan  7 10:35:21 2016"

data = read.delim("data.txt", 
                  sep=",",
                  header = FALSE,
                  colClasses = "character",
                  col.names=c("state_code", "state_fips", "county_fips", "county_name", "class_fips"))

## head(data)
## str(data)
## dim(data)