## setwd("/Users/rogerfischer/datamap/geoid/CH/municipality/2010")
## getwd()

## https://raw.githubusercontent.com/datamapio/geoid/master/CH/municipality/2010/ch_municipality_20101121_with_kommunanzen_and_swiss_abroad.csv
ref_file <- "ch_municipality_20101121_with_kommunanzen_and_swiss_abroad.csv"
ref <- read.csv(ref_file, header = TRUE, sep = ",", stringsAsFactors=FALSE, fileEncoding="UTF-8") 

## EXT
## https://raw.githubusercontent.com/datamapio/geoid/master/CH/municipality/2010/ext_initiative_20101128.csv
ext_file <- "ext_initiative_20101128.csv"
ext <- read.csv(ext_file, header = TRUE, sep = ",", stringsAsFactors=FALSE) 

## Only used when there is a "," in the numbers
## x <- ext[, c(3:9)] 
## x <- apply(x, 2, function(y) as.numeric(gsub(",", "", y)))
## ext[, c(3:9)] <- x

## Merge REF and EXT
ext$GMDE <- ext$gdenr
data <- merge(ref, ext, by="GMDE", all=TRUE)
library(dplyr)
## entitled_to_vote, votes_cast, turnout, valid_votes,   yes, no, yes_percentage
data <- select(data, id, municipality_name, entitled_to_vote, votes_cast, turnout, valid_votes, yes, no, yes_percentage)

write.table(data, file="REAL_election_municipality_20101128.csv", sep="," ,col.names=TRUE, row.names=FALSE)

