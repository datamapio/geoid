## setwd("/Users/rogerfischer/datamap/geoid/CH")
## getwd()

## Base Download to create REF files for Switzerland
## =================================================

## Excel to create REF files for Cantons, Districts and Municipalities in CH (01.01.2016)
## http://www.bfs.admin.ch/bfs/portal/de/index/infothek/nomenklaturen/blank/blank/gem_liste/03.html
## Imported as xls file: http://www.bfs.admin.ch/bfs/portal/de/index/infothek/nomenklaturen/blank/blank/gem_liste/03.Document.90142.xls
fileUrl <- "http://www.bfs.admin.ch/bfs/portal/de/index/infothek/nomenklaturen/blank/blank/gem_liste/03.Document.90142.xls"
download.file(fileUrl, destfile = "ch_canton_district_municipality_2016.xls", method = "curl")

dateDownloaded <- date()
dateDownloaded # "Tue Jan 12 15:17:15 2016"

install.packages("gdata")
require(gdata)

## Canton
canton <- read.xls ("ch_canton_district_municipality_2016.xls", sheet = 4, header = TRUE, stringsAsFactors=FALSE)
write.table(data, file="canton/ch_canton_2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## District
district <- read.xls ("ch_canton_district_municipality.xls", sheet = 3, header = TRUE, stringsAsFactors=FALSE)

## Muncipality
municipality <- read.xls ("ch_canton_district_municipality.xls", sheet = 2, header = TRUE, stringsAsFactors=FALSE)




