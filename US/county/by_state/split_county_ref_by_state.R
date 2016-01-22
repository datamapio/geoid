## setwd("/Users/rogerfischer/datamap/geoid/US/county/by_state")
## getwd()

## If you don't have the file locally already, use the fileUrl below:
## fileUrl <- "https://raw.githubusercontent.com/datamapio/geoid/master/US/county/us_county_congressionalvote_2010.csv"

ref_2010 <- read.csv("/Users/rogerfischer/datamap/geoid/US/county/us_county_congressionalvote_2010.csv", 
                     header = TRUE, sep = ",", stringsAsFactors=FALSE, 
                     colClasses = c("character", "character", "character", "character", 
                                    "character", "character", "character"))


## By State
The 4 states that had changes during 2010-2016 are Alaska, Louisiana, South Dakota and Virginia. All others remain the same.
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

## Arkansas 2010-2016 (no changes)
arkansas <- filter(ref_2010, state_code == "AR")
write.table(arkansas, file="arkansas/arkansas_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## Colorado 2010-2016 (no changes)
colorado <- filter(ref_2010, state_code == "CO")
write.table(colorado, file="colorado/colorado_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## Georgia 2010-2016 (no changes)
georgia <- filter(ref_2010, state_code == "GA")
write.table(georgia , file="georgia/georgia_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## Massachusetts 2010-2016 (no changes)
massachusetts <- filter(ref_2010, state_code == "MA")
write.table(massachusetts, file="massachusetts/massachusetts_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## Minnesota 2010-2016 (no changes)
minnesota <- filter(ref_2010, state_code == "MN")
write.table(minnesota, file="minnesota/minnesota_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## North Dakota 2010-2016 (no changes)
north_dakota <- filter(ref_2010, state_code == "ND")
write.table(north_dakota, file="north_dakota/north_dakota_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## Oklahoma 2010-2016 (no changes)
oklahoma <- filter(ref_2010, state_code == "OK")
write.table(oklahoma, file="oklahoma/oklahoma_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## Tennessee 2010-2016 (no changes)
tennessee <- filter(ref_2010, state_code == "TN")
write.table(tennessee, file="tennessee/tennessee_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)
	
## Texas 2010-2016 (no changes)
texas <- filter(ref_2010, state_code == "TX")
write.table(texas, file="texas/texas_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## Vermont 2010-2016 (no changes)
vermont <- filter(ref_2010, state_code == "VT")
write.table(vermont, file="vermont/vermont_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)


## Virginia: Attention changes
#Deleted Counties or County Equivalent Entities Bedford (independent) city, Virginia (51-515): Changed to town status and added to Bedford County (51-019) effective July 1, 2013.
#Bedford County, Virginia (51-019): Added the former independent city of Bedford (51-515) effective July 1, 2013; estimated net added population 6,222.
## With 84051515, Date:  2010-20130630
## Without 84051515, Date: 20130701-2016
virginia2010_20130630 <- filter(ref_2010, state_code == "VA")
virginia20130701_2016 <- virginia2010_20130630
virginia20130701_2016 <- filter(virginia20130701_2016, fips != "51515") 
glimpse(virginia2010_20130630)
write.table(virginia2010_20130630, file="virginia/virginia_county_2010-20130630.csv", sep="," ,col.names=TRUE, row.names=FALSE)
glimpse(virginia20130701_2016)
write.table(virginia20130701_2016, file="virginia/virginia_county_20130701-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)
  
## Wyoming 2010-2016 (no changes)
wyoming <- filter(ref_2010, state_code == "WY")
write.table(wyoming, file="wyoming/wyoming_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)
  
## Kansas 2010-2016 (no changes)
kansas <- filter(ref_2010, state_code == "KS")
write.table(kansas, file="kansas/kansas_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## Kentucky 2010-2016 (no changes)
kentucky <- filter(ref_2010, state_code == "KY")
write.table(kentucky, file="kentucky/kentucky_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## Louisiana: Changes
## LaSalle Parish, Louisiana (22-059) Name corrected from La Salle Parish (removing space) reported as of January 1, 2011.
louisiana2010_20103112 <- filter(ref_2010, state_code == "LA")
louisiana2011_2016 <- louisiana2010_20103112
lasalle <- louisiana2011_2016[louisiana2011_2016$fips == "22059", ] 
lasalle$county_name <- "LaSalle Parish"
louisiana2011_2016[louisiana2011_2016$fips == "22059", ] <- lasalle
glimpse(louisiana2011_2016)
write.table(louisiana2010_20103112, file="louisiana/louisiana_county_2010-20101231.csv", sep="," ,col.names=TRUE, row.names=FALSE)
write.table(louisiana2011_2016, file="louisiana/louisiana_county_20110101-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## Maine 2010-2016 (no changes)
maine <- filter(ref_2010, state_code == "ME")
write.table(maine, file="maine/maine_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)
 
## Nebraska 2010-2016 (no changes)
nebraska <- filter(ref_2010, state_code == "NE")
write.table(nebraska, file="nebraska/nebraska_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## Hawaii 2010-2016 (no changes)
hawaii <- filter(ref_2010, state_code == "HI")
write.table(hawaii, file="hawaii/hawaii_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)
