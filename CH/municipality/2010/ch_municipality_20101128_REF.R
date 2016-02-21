## setwd("/Users/rogerfischer/datamap/geoid/CH/municipality/2010")
## getwd()

g2g10 <- read.csv("G2G10.csv", header = TRUE, stringsAsFactors=FALSE)

## New Names
## id, municipality_number, municipality_name, district_number, canton_number, 
## GMDE, BEZIRK, KT, NAME
library(stringr)
## Add a new variable county_fips to ext2 with leading zeros
ref <- g2g10
ref$municipality_number <- str_pad(ref$GMDE, width=4, pad = "0")
ref$municipality_name <- ref$NAME
ref$district_number <- str_pad(ref$BEZIRK, width=4, pad = "0")
ref$canton_number <- str_pad(ref$KT, width=2, pad = "0")
ref$id <- paste("756", ref$district_number, ref$municipality_number, sep="")

library(dplyr)
ref <- select(ref, id, municipality_number, municipality_name, district_number, canton_number, GMDE, BEZIRK, KT, NAME)

write.table(ref, file="ch_municipality_2010_with_kommunanzen.csv", sep="," , col.names=TRUE, row.names=FALSE)


## THE REF FILE FOR THE ELECTION, NOVEMBER 28, 2010


