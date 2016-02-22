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
ref_reduced <- ref[(1:2600), ]

write.table(ref_reduced, file="ch_municipality_2010_with_kommunanzen.csv", sep="," , col.names=TRUE, row.names=FALSE)

## THE REF FILE FOR THE ELECTION, NOVEMBER 28, 2010
## Remove these 14
##---,5011 Fusion with 5238
##---,5098 Fusion with 5398
##---,5101 Fusion with 5398
##---,5106 Fusion with 5398
##---,5110 Fusion with 5398
##---,5116 Fusion with 5398
##---,5123 Fusion with 5398
##---,5127 Fusion with 5398
##---,5128 Fusion with 5398
##---,5134 Fusion with 5398
##---,5153 Fusion with 5238
##---,5165 Fusion with 5238
##---,5217 Fusion with 5238
##---,5223 Fusion with 5238
del_muni <- c("5011", "5098", "5101", "5106", "5110", "5116", "5123", "5127", "5128", "5134", "5153", "5165", "5217", "5223")
ref_nov <-ref_reduced[!(ref_reduced$municipality_number %in% del_muni), ] 

## Add 5238 and 5398
id <- c(75621055238, 75621045398)
municipality_number <- c(5238, 5398)
municipality_name <- c("Monteceneri", "Gambarogno")
district_number <- c(2105, 2104)
canton_number <- c(21, 21)
GMDE <- c(5238, 5398)
BEZIRK <- c(2105, 2104)
KT <- c(21, 21)               
NAME <- c("Monteceneri", "Gambarogno")
new5238_5398 <- data.frame(id, municipality_number, municipality_name, district_number, canton_number, GMDE, BEZIRK, KT, NAME)

ref_nov <- rbind(ref_nov, new5238_5398)
ref_nov <- ref_nov[order(ref_nov$id), ] 
## Check: ref_nov[(1818:1878), ]

##November REF File
write.table(ref_nov, file="ch_municipality_20101121_with_kommunanzen.csv", sep="," ,col.names=TRUE, row.names=FALSE)

##November REF File with Swiss Abroad
ext <- read.csv("ext_initiative_20101128.csv", header = TRUE, stringsAsFactors=FALSE) 
swiss_abroad <- slice(ext, 2574:2582)
swiss_abroad <- select(swiss_abroad, municipality_number=gdenr, municipality_name=gdename)

id <-  c(75603009030, 75604009040, 75612009120, 75616009160, 75617009170, 75619009190, 75620009200, 75622009220, 75625009250)
swiss_abroad$id <- id
swiss_abroad$district_number <- NA
swiss_abroad$canton_number <- NA
swiss_abroad$GMDE <- swiss_abroad$municipality_number
swiss_abroad$BEZIRK <- NA
swiss_abroad$KT <- NA
swiss_abroad$NAME <- NA
swiss_abroad <- select(swiss_abroad, id, municipality_number, municipality_name, district_number, canton_number, GMDE, BEZIRK, KT, NAME)

ref_nov_with_swiss_abroad <- rbind(ref_nov, swiss_abroad)

write.table(ref_nov_with_swiss_abroad, file="ch_municipality_20101121_with_kommunanzen_and_swiss_abroad.csv", sep="," ,col.names=TRUE, row.names=FALSE)




