## setwd("/Users/rogerfischer/datamap/geoid/CH/district")
## getwd()

## Transform source to GeoID aka REF File
## ======================================

list.files()
district <- read.csv("ch_district_2016_source.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE) 



# Replaced GDEKT,GDEBZNR,GDEBZNA with new header
names(district) <- c("gdekt", "gdebznr", "gdebzna")
district$district_number <- district$gdebznr
district$district_name <- district$gdebzna
district$canton_code <-   district$gdekt

## head(district)


## Adding leading zeroes
library(stringr)
district$district_number <- str_pad(district$district_number, 4, pad = "0")

district$id <- paste("756", district$district_number, sep="")
district <- district[c("id", "district_number", "district_name", "canton_code", "gdebznr", "gdebzna", "gdekt")]

## Export as csv
write.table(district, file="ch_district_2016.csv",sep=",",col.names=TRUE,row.names=FALSE)

