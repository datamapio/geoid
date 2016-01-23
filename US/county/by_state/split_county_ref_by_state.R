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
  
## Idaho 2010-2016 (no changes)
idaho <- filter(ref_2010, state_code == "ID")
write.table(idaho, file="idaho/idaho_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)
  
## Michigan 2010-2016 (no changes)
michigan <- filter(ref_2010, state_code == "MI")
write.table(michigan, file="michigan/michigan_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)
  
## Mississippi 2010-2016 (no changes)
mississippi <- filter(ref_2010, state_code == "MS")
write.table(mississippi, file="mississippi/mississippi_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## Florida 2010-2016 (no changes)
florida <- filter(ref_2010, state_code == "FL")
write.table(florida, file="florida/florida_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)
	
## Illinois 2010-2016 (no changes)
illinois <- filter(ref_2010, state_code == "IL")
write.table(illinois, file="illinois/illinois_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)
	
## Missouri 2010-2016 (no changes)
missouri <- filter(ref_2010, state_code == "MO")
write.table(missouri, file="missouri/missouri_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## North Carolina 2010-2016 (no changes)
north_carolina <- filter(ref_2010, state_code == "NC")
write.table(north_carolina, file="north_carolina/north_carolina_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)
 
## Ohio 2010-2016 (no changes)
ohio <- filter(ref_2010, state_code == "OH")
write.table(ohio, file="ohio/ohio_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)
  
## Arizona 2010-2016 (no changes)
arizona <- filter(ref_2010, state_code == "AZ")
write.table(arizona, file="arizona/arizona_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## Utah 2010-2016 (no changes)
utah <- filter(ref_2010, state_code == "UT")
write.table(utah, file="utah/utah_county_2010-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## Alaska: Changes
alaska <- filter(ref_2010, state_code == "AK")
alaska2010_20130102 <- alaska
alaska20130103_20150630 <- alaska2010_20130102
## Petersburg Borough, Alaska (02-195): Created from part of former Petersburg Census Area (02-195) and part of Hoonah-Angoon Census Area (02-105) effective January 3, 2013; estimated population 3,203.
# Hoonah-Angoon Census Area, Alaska (02-105): Part taken to create new Petersburg Borough (02-195) effective January 3, 2013; estimated detached population: 1
# Prince of Wales-Hyder Census Area, Alaska (02-198): Prince of Wales-Hyder Census Area (02-198) added part of the former Petersburg Census Area (02-195) effective January 3, 2013; estimated added population 613.
petersburg <- alaska20130103_20150630[alaska20130103_20150630$fips == "02195", ] 
petersburg$county_name <- "Petersburg Borough"
petersburg$class_fips <- "H1"
alaska20130103_20150630[alaska20130103_20150630$id == "84002195", ] <- petersburg

# Kusilvak Census Area, Alaska (02-158) Changed name and code from Wade Hampton Census Area (02-270) effective July 1, 2015. Wade Hampton Census Area, Alaska (02-270) Changed name and code to Kusilvak Census Area (02-158) effective July 1, 2015.
alaska20150701_2016 <- alaska20130103_20150630
kusilvak <- alaska20150701_2016[alaska20150701_2016$fips == "02270", ] 
kusilvak$county_name <- "Kusilvak Census Area"
kusilvak$id <- "84002158"
kusilvak$fips <- "02158"
kusilvak$county_fips <- "158"
alaska20150701_2016[alaska20150701_2016$fips == "02270", ] <- kusilvak
alaska20150701_2016 <- arrange(alaska20150701_2016, id)

write.table(alaska2010_20130102, file="alaska/alaska_county_2010-20130102.csv", sep="," ,col.names=TRUE, row.names=FALSE)
write.table(alaska20130103_20150630, file="alaska/alaska_county_20130103-20150630.csv", sep="," ,col.names=TRUE, row.names=FALSE)
write.table(alaska20150701_2016, file="alaska/alaska_county_20150701-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## South Dakota: Changes
# Oglala Lakota County, South Dakota (46-102) Changed name and code from Shannon County (46-113) effective May 1, 2015. Shannon County, South Dakota (46-113) Changed name and code to Oglala Lakota County (46-102) effective May 1, 2015.
south_dakota2010_20150430 <- filter(ref_2010, state_code == "SD")
south_dakota20150501_2016 <- south_dakota2010_20150430
oglala <- south_dakota20150501_2016[south_dakota20150501_2016$fips == "46113", ] 
oglala$id <- "84046102"
oglala$fips <- "46102"
oglala$county_name <- "Oglala Lakota County"
oglala$county_fips <- "102"
south_dakota20150501_2016[south_dakota20150501_2016$fips == "46113", ] <- oglala
south_dakota20150501_2016 <- arrange(south_dakota20150501_2016, id)
write.table(south_dakota2010_20150430, file="south_dakota/south_dakota_county_2010-20150430.csv", sep="," ,col.names=TRUE, row.names=FALSE)
write.table(south_dakota20150501_2016, file="south_dakota/south_dakota_county_20150501-2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)




