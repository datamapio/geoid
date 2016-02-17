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

ref

library(stringr)
ext$county_fips <- str_pad(ext2$FIPS.Code, width=3, pad = "0")


