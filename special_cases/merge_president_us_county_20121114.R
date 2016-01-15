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
## EXT ()
group_by_state_code <- group_by(ext, State.Postal)
county_by_state_ext <- summarize(group_by_state_code, count = n())
write.table(county_by_state_ext, file="us_county_by_state_ext.csv", sep="," ,col.names=TRUE, row.names=FALSE)
## change of matching variable
county_by_state_ext$state_code <- county_by_state_ext$State.Postal

## REF
install.packages("curl")
library(curl)
county_by_state_ref<- read.csv( curl("https://raw.githubusercontent.com/datamapio/geoid/master/US/county/us_county_by_state_2010-2012.csv") )

## Compare REF TO EXT
county_by_state_ext$county_number_ext <- county_by_state_ext$count
county_by_state_ref$county_number_ref <- county_by_state_ref$county_number
ref_ext_county_by_state <- merge(county_by_state_ref, county_by_state_ext, by="state_code", all=T)
ref_ext_county_by_state <- ref_ext_county_by_state[c("id", "state_code", "county_number_ref", "county_number_ext")]
write.table(ref_ext_county_by_state, file="ref_ext_comparison_us_county_by_state.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## EXT 2 (with 4639 rows, 203 variables)
ext2 <- read.xls ("ext.xls", sheet = 2, header = TRUE, stringsAsFactors=FALSE)
dim(ext2) # [1] 4639  203, WOW!

group_by_state_code2 <- group_by(ext2, State.Postal)
county_by_state_ext2 <- summarize(group_by_state_code2, count = n())
dim(county_by_state_ext2) # [1] 51  2

## write.table(county_by_state_ext2, file="us_county_by_state_ext2.csv", sep="," ,col.names=TRUE, row.names=FALSE)
## change of matching variable
county_by_state_ext2$state_code <- county_by_state_ext2$State.Postal

## Compare REF TO EXT
county_by_state_ext2$county_number_ext <- county_by_state_ext2$count
ref_ext2_county_by_state <- merge(county_by_state_ref, county_by_state_ext2, by="state_code", all=T)
ref_ext2_county_by_state <- ref_ext2_county_by_state[c("id", "state_code", "county_number_ref", "county_number_ext")]
ref_ext2_county_by_state <- ref_ext2_county_by_state[order(ref_ext2_county_by_state$id),]
write.table(ref_ext2_county_by_state, file="ref_ext2_comparison_us_county_by_state.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## FILTER STATES THAT LOOK SPECIAL

## AK, 84002, 29 counties
ext2_AK <- subset(ext2, State.Postal == "AK")

## CT, 84009, 8 counties
ext2_CT <- subset(ext2, State.Postal == "CT")
ext2_CT_county_fips_no <- ext2_CT[c("FIPS.Code", "County.Name", "County.Number")]
group_by_ext2_CT_county_fips_no <- group_by(ext2_CT_county_fips_no, FIPS.Code)
dim(group_by_ext2_CT_county_fips_no) # 170 x for 8 counties
county_by_fips_ext2_CT_county_fips_no <- summarize(group_by_ext2_CT_county_fips_no, count = n())
View(county_by_fips_ext2_CT_county_fips_no)


