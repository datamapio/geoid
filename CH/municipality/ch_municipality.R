## setwd("/Users/rogerfischer/datamap/geoid/CH/municipality")
## getwd()

## Transform source to GeoID aka REF File
## ======================================

list.files()
municipality <- read.csv("ch_municipality_2016_source.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE) 



# Replaced GDEKT,GDEBZNR,GDENR,GDENAME,GDENAMK,GDEBZNA,GDEKTNA,GDEMUTDAT with new header
names(municipality) <- c("gdekt", "gdebznr", "gdenr","gdename", "gdenamk", "gdebzna", "gdektna", "gdemutdat")
municipality$municipality_number <- municipality$gdenr
municipality$municipality_name <- municipality$gdename
municipality$canton_code <-   municipality$gdebzna
municipality$canton_code <-   municipality$gdekt

## head(district)


## Adding leading zeroes
library(stringr)
municipality$municipality_number <- str_pad(municipality$municipality_number, 4, pad = "0")
municipality$district_number <- str_pad(municipality$gdebznr, 4, pad = "0")

municipality$id <- paste("756", municipality$district_number, municipality$municipality_number, sep="")


municipality <- municipality[c("id", "municipality_number", "municipality_name", "district_number", "canton_code",  "gdekt", "gdebznr", "gdenr", "gdename", "gdenamk", "gdebzna", "gdektna", "gdemutdat")]

## Export as csv
write.table(municipality, file="ch_municipality_2016.csv",sep=",",col.names=TRUE,row.names=FALSE)

