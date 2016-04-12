## setwd("/Users/rogerfischer/datamap/geoid/US/precinct/by_state/california/by_county/san_francisco/election")
## getwd()

## REF (605 observations)
## https://github.com/datamapio/geoid/blob/master/US/precinct/by_state/california/by_county/san_francisco/san_francisco_precinct_20120702.csv
ref <- read.csv("../san_francisco_precinct_20120702.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE, fileEncoding="UTF-8")

## EXT (only 397 observations)
## https://github.com/datamapio/geoid/blob/master/US/precinct/by_state/california/by_county/san_francisco/election/ext/prop_f_election_day_20151103_20151119.csv
ext <- read.csv("ext/prop_f_election_day_20151103_20151119.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE, fileEncoding="UTF-8")

## MERGE on pct_2012 (REF) and polling_precinct (EXT)
data <- merge(ref, ext, by.x="pct_2012", by.y="polling_precinct", all=TRUE)

library(dplyr)
data <- select(data, id, pct_2012, precinct_names, neighborhood, yes_percentage)
write.table(data, file="DATA_prop_f_election_day_yes_percentage_20151103_20151119.csv", sep="," ,col.names=TRUE, row.names=FALSE)