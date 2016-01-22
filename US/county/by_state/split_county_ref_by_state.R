## setwd("/Users/rogerfischer/datamap/geoid/US/county/by_state")
## getwd()

## If you don't have the file locally already, use the fileUrl below:
## fileUrl <- "https://raw.githubusercontent.com/datamapio/geoid/master/US/county/us_county_congressionalvote_2010.csv"

ref_2010 <- read.csv("/Users/rogerfischer/datamap/geoid/US/county/us_county_congressionalvote_2010.csv", 
                     header = TRUE, sep = ",", stringsAsFactors=FALSE, 
                     colClasses = c("character", "character", "character", "character", 
                                    "character", "character", "character"))


## By State
The 3 states that had changes are Alaska, Louisiana and Virginia. All others remain the same.
library(dplyr)

## Iowa 2010-2016 (no changes)
iowa <- filter(ref_2010, state_code == "IA")
write.table(iowa, file="iowa/iowa_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## New Hampshire 2010-2016 (no changes)
new_hampshire <- filter(ref_2010, state_code == "NH")
write.table(new_hampshire, file="new_hampshire/new_hampshire_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## Nevada 2010-2016 (no changes)
nevada <- filter(ref_2010, state_code == "NV")
write.table(nevada, file="nevada/nevada_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## South Carolina 2010-2016 (no changes)
south_carolina <- filter(ref_2010, state_code == "SC")
write.table(south_carolina, file="south_carolina/south_carolina_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## Washington 2010-2016 (no changes)
washington <- filter(ref_2010, state_code == "WA")
write.table(washington, file="washington/washington_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## Alabama 2010-2016 (no changes)
alabama <- filter(ref_2010, state_code == "AL")
write.table(alabama, file="alabama/alabama_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)


