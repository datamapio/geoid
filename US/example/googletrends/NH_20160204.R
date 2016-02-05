## setwd("/Users/rogerfischer/datamap/geoid/US/example/googletrends")
## getwd()

## Download from: https://raw.githubusercontent.com/googletrends/data/master/02042016_NHprimary.csv
ext <- read.csv ("02042016_NHprimary.csv", header=FALSE, sep = ",", stringsAsFactors=FALSE)

library(dplyr)

colnames(ext) <-  ext[3, ]
ext <- slice(ext, 4:14)
## Compare with:
## https://github.com/datamapio/geoid/blob/master/US/county/by_state/new_hampshire/new_hampshire_county_2010-2016.csv
## Line 4: 84050027  50027	Windsor County	VT	50	027 - Vermont mixed up with New Hampshire 
only33 <- grepl("^33", ext$code)
## Filter out Vermont
ext <- ext[only33, ]

## X.5 => X.16 GOOGLE TRENDS: Candidates most searched for 7 days up to Feb 4
ext_people <- ext[, c(2, 7:18)]
colnames(ext_people) <- c("fips", "bush", "carson", "cruz", "kasich", "randpaul", "rubio", "trump", "fiorina", "christie", "santorum", "clinton", "sanders")

## MERGE with REF
## https://raw.githubusercontent.com/datamapio/geoid/master/US/county/by_state/new_hampshire/new_hampshire_county_2010-2016.csv
ref <- read.csv ("/Users/rogerfischer/datamap/geoid/US/county/by_state/new_hampshire/new_hampshire_county_2010-2016.csv", header=TRUE, sep = ",", stringsAsFactors=FALSE)

data_people <- merge(ref, ext_people, by="fips")
data_people <- data_people[, c(2:3, 8:19)]
write.table(data_people, file="google_trends_new_hampshire_county_20160129-20160204.csv", sep="," , col.names=TRUE, row.names=FALSE)

## NEXT: The same could be made by topic