## setwd("/Users/rogerfischer/datamap/geoid/CH/municipality/2014")
## getwd()

## If you don't have glg14.csv locally, use:
## https://raw.githubusercontent.com/datamapio/geoid/master/CH/municipality/2014/g1g14.csv
glg14 <- read.csv("g1g14.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE) 

## glg14
## GMDNR      GMDNAME           BZNR   KTNR 
## 1          Aeugst am Albis   101    1
## 6803       Rocourt           2603   26 

## https://github.com/datamapio/geoid/blob/master/lookup.md#municipality-commune--gemeinde
## Type: Numeric, 11
## Country (3, numeric, ISO) | State (2, numeric, BFS) | District (2, numeric, BFS) | Municipality (4, numeric, BFS)
## 756 | 01 | 12 | 0261
## Ex. 75601120261 = Municipality of Zurich

## Construction
## 756 | BZNR (4) | GMDNR (4) ; BZNR = State(2) + District(2), GMDNR = Municipality(4)

ref <- glg14

library(stringr)
ref$district_number <- str_pad(ref$BZNR, width=4, pad = "0")
ref$municipality_number <- str_pad(ref$GMDNR, width=4, pad = "0")
ref$canton_number  <- str_pad(ref$KTNR, width=2, pad = "0")
ref$municipality_name <- ref$GMDNAME

## Creating the GeoID
ref$id <- paste("756", ref$district_number, ref$municipality_number, sep="")

## Reordering Columns
library(dplyr)

## Select columns by name
ref <- select(ref, id, municipality_number, municipality_name, district_number, canton_number, 
              GMDNR, GMDNAME, BZNR, KTNR, GRNR, AREA_HA, X_MIN, X_MAX, Y_MIN, Y_MAX, X_CNTR, 
              Y_CNTR, Z_MIN, Z_MAX, Z_AVG, Z_MED)

write.table(ref, file="ch_municipality_2014_with_4_kommunanzen.csv", sep="," ,col.names=TRUE, row.names=FALSE)


## Include Swiss Abroad
## https://github.com/datamapio/geoid/blob/master/CH/municipality/2014/ext1_initiative_20140902.csv
ext1 <- read.csv("ext1_initiative_20140902.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE) 
ch_abroad <-  ext1[(2343:2353), ]
ch_abroad$municipality_number <- ch_abroad$gdenr
ch_abroad$municipality_name <- ch_abroad$gdename
## 75603  03	LU	Luzern

## Construction of the GeoID: 
## 756 | 03 | 00 | 9030 ; 00 for the District, and we keep using the gdenr from the Stats Office
trim <- function (x) gsub("^9|0$", "", x)
ch_abroad$id <- paste("756", trim(ch_abroad$gdenr), "00", ch_abroad$municipality_number, sep="")
ch_abroad <- select(ch_abroad, id, municipality_number, municipality_name, gdenr, gdename)

write.table(ch_abroad, file="ch_abroad_2014.csv", sep="," ,col.names=TRUE, row.names=FALSE)
ch_abroad <- select(ch_abroad, id, municipality_number, municipality_name)

##Minimum REF File for February 2014 election
## id, gdenr, municipality_name

ref_el <- select(ref, id, gdenr=GMDNR, municipality_name) 
ch_abroad_el <- select(ch_abroad, id, gdenr, municipality_name)
ref_el2014 <- rbind(ref_el, ch_abroad_el)

write.table(ref_el2014, file="ch_municipality_2014_with_swiss_abroad.csv", sep="," ,col.names=TRUE, row.names=FALSE)
