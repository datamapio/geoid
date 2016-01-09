## setwd("/Users/rogerfischer/datamap/geoid/US/state")
## getwd()

## American National Standards Institute (ANSI) Codes for States, the District of Columbia, Puerto Rico, and the Insular Areas of the United States
## See also: https://www.census.gov/geo/reference/ansi_statetables.html
fileUrl <- "http://www2.census.gov/geo/docs/reference/state.txt"
download.file(fileUrl, destfile = "data.txt", method = "curl")
list.files()

dateDownloaded <- date()
dateDownloaded # "Fri Jan  8 11:20:41 2016"

# Replaced STATE|STUSAB|STATE_NAME|STATENS with new header
data = read.delim("data.txt", 
                  sep="|",
                  header = TRUE,
                  colClasses = "character",
                  col.names=c("state_fips", "state_code", "state_name", "gnisid"))

## head(data)
## str(data)
## dim(data)

data$id <- paste("840", data$state_fips, sep="")
data <- data[c("id", "state_fips", "state_code", "state_name", "gnisid")]

## Export as csv
write.table(data, file="us_state_and_other.csv",sep=",",col.names=TRUE,row.names=FALSE)

## Only States and DC (without Puerto Rico, Guam etc.)
# state_code <- unique(data$state_code)
# nonstate_code <- c("AS", "GU", "MP", "PR", "UM", "VI")

library(dplyr)
state_data <- slice(data, 1:51)
## Crosscheck with data[52, ] => gives AS, fips 60

## Export state&DC data
write.table(state_data, file="us_state_congressionalvote.csv", sep="," ,col.names=TRUE, row.names=FALSE)


