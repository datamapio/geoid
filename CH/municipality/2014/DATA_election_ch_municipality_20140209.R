## setwd("/Users/rogerfischer/datamap/geoid/CH/municipality/2014")
## getwd()

## REF including Swiss Abroad, all Municipalities and Kommunanzen
## https://raw.githubusercontent.com/datamapio/geoid/master/CH/municipality/2014/ch_municipality_2014_with_swiss_abroad.csv

ref_file <- "ch_municipality_2014_with_swiss_abroad.csv"
ref <- read.csv(ref_file, header = TRUE, sep = ",", stringsAsFactors=FALSE, fileEncoding="UTF-8") 

## EXT
## https://raw.githubusercontent.com/datamapio/geoid/master/CH/municipality/2014/ext1_initiative_20140902.csv  
ext_file <- "ext1_initiative_20140902.csv"
ext <- read.csv(ext_file, header = TRUE, sep = ",", stringsAsFactors=FALSE) 
x <- ext[, c(3:9)] 
x <- apply(x, 2, function(y) as.numeric(gsub(",", "", y)))
ext[, c(3:9)] <- x

## Merge REF and EXT
data <- merge(ref, ext, by="gdenr", all=TRUE)
library(dplyr)
## entitled_to_vote, votes_cast, turnout, valid_votes,   yes, no, yes_percentage
data <- select(data, id, municipality_name, entitled_to_vote, votes_cast, turnout, valid_votes, yes, no, yes_percentage)

write.table(data, file="REAL_election_municipality_20140209.csv", sep="," ,col.names=TRUE, row.names=FALSE)
