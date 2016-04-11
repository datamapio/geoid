## setwd("/Users/rogerfischer/datamap/geoid/US/precinct/by_state/california/by_county/san_francisco")
## getwd()

## Source: SF_DOE_Precincts_20120702 from http://sfgov.org/elections/sites/default/files/2012lines.zip
ref_file <- "SF_DOE_Precincts_20120702.csv"
ref <- read.csv(ref_file, header = TRUE, sep = ",", stringsAsFactors=FALSE, fileEncoding="UTF-8") 

ref2_file <- "http://sfgov.org/elections/sites/default/files/Documents/ElectionsArchives/2016/June/ZipConsolDistBT_20160316.txt"
download.file(ref2_file, destfile = "ref2.txt", method = "curl")

## Always document the time of the download as the file content or location might change
dateDownloaded <- date()
dateDownloaded # "Sun Apr 10 17:04:22 2016"

ref2 <- read.table("ref2.txt", header = TRUE, sep="\t", stringsAsFactors=FALSE, fileEncoding="UTF-8") 

ref3_file <- "http://sfgov.org/elections/sites/default/files/Documents/ElectionsArchives/2016/June/ConsolDistBT_20160316_NeighDups.txt"
download.file(ref3_file, destfile = "ref3.txt", method = "curl")
dateDownloaded <- date()
dateDownloaded # Sun Apr 10 17:57:48 2016"
ref3 <- read.table("ref3.txt", header = TRUE, sep="\t", stringsAsFactors=FALSE, fileEncoding="UTF-8") 

ref4_file <- "http://sfgov.org/elections/ftp/uploadedfiles/elections/ElectionsArchives/opendata/2015nov/20151103_ConsolDistBT.txt"
download.file(ref4_file, destfile = "ref4.txt", method = "curl")
dateDownloaded <- date()
dateDownloaded # "Sun Apr 10 18:41:23 2016"
ref4 <- read.table("ref4.txt", header = TRUE, sep="\t", stringsAsFactors=FALSE, fileEncoding="UTF-8") 

ref <- ref[order(ref$PREC_2012), ]  ## 605 observations
write.table(ref, file="from_map.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## Other References
ref2 <- ref2[order(ref2$consolidation), ] ## 869 observations
write.table(ref2, file="ballot_type_extract_20160607.csv", sep="," ,col.names=TRUE, row.names=FALSE)
ref3 <- ref3[order(ref3$VotingPrecinctID), ] ## 599 observations
write.table(ref3, file="ballot_type_extract_2_20160607.csv", sep="," ,col.names=TRUE, row.names=FALSE)
ref4 <- ref4[order(ref4$VotingPrecinctID), ] ## 403 observations
write.table(ref4, file="consoldistbt_20151103.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## Comparing map to ballot type extract
r <- as.data.frame(ref$PREC_2012)
r3 <- as.data.frame(ref3$VotingPrecinctID)

library("daff")
difference <- diff_data(r, r3)

## Creating the REF File
## https://github.com/datamapio/geoid/blob/master/lookup.md#precinct-code
## 840 | 06 | 075 | PCT | 1117
ref$id <- paste("8400675PCT", ref$PREC_2012, sep="")
ref <- select(ref, i)



