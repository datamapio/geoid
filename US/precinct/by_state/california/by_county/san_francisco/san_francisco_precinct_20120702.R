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
## Check if file has been downloaded
list.files()
dateDownloaded <- date()
dateDownloaded # Sun Apr 10 17:57:48 2016"

ref3 <- read.table("ref3.txt", header = TRUE, sep="\t", stringsAsFactors=FALSE, fileEncoding="UTF-8") 


ref <- ref[order(ref$PREC_2012), ]  ## 605 observations
write.table(ref, file="from_map.csv", sep="," ,col.names=TRUE, row.names=FALSE)
ref2 <- ref2[order(ref2$consolidation), ] ## 869 observations
write.table(ref2, file="ballot_type_extract_20160607.csv", sep="," ,col.names=TRUE, row.names=FALSE)
ref3 <- ref3[order(ref3$VotingPrecinctID), ] ## 599 observations
write.table(ref3, file="ballot_type_extract_2_20160607.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## Comparing map to ballot type extract
r <- as.data.frame(ref$PREC_2012)
r3 <- as.data.frame(ref3$VotingPrecinctID)

library("daff")
difference <- diff_data(r, r3)


---,1105
+++,7509
+++,7527
...,...
,1104
---,1105
,1106
...,...
,7509
+++,7509
---,7511
,7512
...,...
,7527
+++,7527
---,7528
,7529
...,...
,7556
---,7557
,7601
...,...
,9503
---,9504
,9505
...,...
,9521
---,9522
,9701
...,...
,9902
---,NA
---,NA
