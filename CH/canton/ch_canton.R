## setwd("/Users/rogerfischer/datamap/geoid/CH/canton")
## getwd()

## Transform source to GeoID aka REF File
## ======================================

list.files()
canton <- read.csv("ch_canton_2016_source.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE) 



# Replaced KTNR|GDEKT|GDEKTNA with new header
names(canton) <- c("ktnr", "gdekt", "gdektna")
canton$canton_code <- canton$gdekt
canton$canton_name <- canton$gdektna

## head(canton)
## str(canton)
## dim(canton)

## Adding leading zeroes
library(stringr)
canton$canton_number <- str_pad(canton$ktnr, 2, pad = "0")

canton$id <- paste("756", canton$canton_number, sep="")
canton <- canton[c("id", "canton_number", "canton_code", "canton_name", "ktnr", "gdekt", "gdektna")]

## Export as csv
write.table(data, file="ch_canton.csv",sep=",",col.names=TRUE,row.names=FALSE)

