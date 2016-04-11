## setwd("/Users/rogerfischer/datamap/geoid/US/precinct/by_state/california/by_county/san_francisco")
## getwd()

## Source: SF_DOE_Precincts_20120702 from http://sfgov.org/elections/sites/default/files/2012lines.zip
ref_file <- "SF_DOE_Precincts_20120702.csv"
ref <- read.csv(ref_file, header = TRUE, sep = ",", stringsAsFactors=FALSE, fileEncoding="UTF-8") 

ref2_file <- "http://sfgov.org/elections/sites/default/files/Documents/ElectionsArchives/2016/June/ZipConsolDistBT_20160316.txt"
download.file(ref2_file, destfile = "ref2.txt", method = "curl")
## Check if file has been downloaded
list.files()

## Always document the time of the download as the file content or location might change
dateDownloaded <- date()
dateDownloaded # "Sun Apr 10 17:04:22 2016"

ref2 <- read.table("ref2.txt", header = TRUE, sep="\t", stringsAsFactors=FALSE, fileEncoding="UTF-8") 

ref <- ref[order(ref$PREC_2012), ]  ## 605 observations
ref2 <- ref2[order(ref2$consolidation), ] ## 869 observations