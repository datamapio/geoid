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
               header = FALSE,
               colClasses = "character",
               col.names=c("state_code", "state_fips", "county_fips", "county_name", "class_fips"))

## head(data)
## str(data)
## dim(data)

## Export as csv
## data <- write.table(data, file="data.csv",sep=",",col.names=FALSE,row.names=FALSE)

data$id <- paste("840", data$state_fips, data$county_fips, sep="")
data$fips <- paste(data$state_fips, data$county_fips, sep="")
data <- data[c("id", "fips", "county_name", "state_code", "state_fips", "county_fips", "class_fips")]

## Export as csv
## write.table(data, file="us_county_2010.csv",sep=",",col.names=FALSE,row.names=FALSE)

## Only States and DC (without Puerto Rico, Guam etc.) for 2010
state_code <- unique(data$state_code)
nonstate_code <- c("AS", "GU", "MP", "PR", "UM", "VI")

library(dplyr)
state_data <- slice(data, 1:3143)
## Crosscheck with data[3144, ] => gives AS, fips 60010

## Export state&DC data 2010
## write.table(state_data, file="us_county_congressionalvote_2010.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## Only States and DC (without Puerto Rico, Guam etc.) for 2011, 2012
## LaSalle Parish, Louisiana (22-059)
## Name corrected from La Salle Parish (removing space) reported as of January 1, 2011.
lasalle <- state_data[state_data$fips == "22059", ] 
lasalle$county_name <- "LaSalle Parish"
state_data[state_data$fips == "22059", ] <- lasalle

## Export state&DC data 2011,2012
write.table(state_data, file="us_county_congressionalvote_2011.csv", sep="," ,col.names=TRUE, row.names=FALSE)
write.table(state_data, file="us_county_congressionalvote_2012.csv", sep="," ,col.names=TRUE, row.names=FALSE)
