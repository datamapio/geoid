## setwd("/Users/rogerfischer/datamap/geoid/US/county")
## getwd()

## 2010 FIPS Codes for Counties and County Equivalent Entities
## See also: https://www.census.gov/geo/reference/codes/cou.html
fileUrl <- "http://www2.census.gov/geo/docs/reference/codes/files/national_county.txt"
download.file(fileUrl, destfile = "data.txt", method = "curl")
list.files()

dateDownloaded <- date()
dateDownloaded # "Thu Jan  7 10:35:21 2016"

data = read.delim("data.txt", 
               sep=",",
               colClasses = "character",
               col.names=c("state_code", "state_fips", "county_fips", "county_name", "class_fips"))

## head(data)
## str(data)

## Export as csv
## data <- write.table(data, file="data.csv",sep=",",col.names=FALSE,row.names=FALSE)

data$id <- paste("840", data$state_fips, data$county_fips, sep="")
data$fips <- paste(data$state_fips, data$county_fips, sep="")
data <- data[c("id", "fips", "county_name", "state_code", "state_fips", "county_fips", "class_fips")]

## Export as csv
## data <- write.table(data, file="us_county_2010.csv",sep=",",col.names=FALSE,row.names=FALSE)
