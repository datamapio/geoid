## setwd("/Users/rogerfischer/datamap/geoid/CH/municipality/2014")
## getwd()

## Download municipality date from the vote
## http://www.bfs.admin.ch/bfs/portal/de/index/themen/17/03/blank/key/2014/013.html
## 438 KB    Volksinitiative «Gegen Masseneinwanderung», nach Gemeinden
## (je-d-17.03.02.04.cz.580.c)
## Bundesamt für Statistik BFS
## 09.02.2014

fileUrl <- "http://www.bfs.admin.ch/bfs/portal/de/index/themen/17/03/blank/key/2014/013.Document.176630.xls"
download.file(fileUrl, destfile = "ext.xls", method = "curl")

dateDownloaded <- date()
dateDownloaded "Mon Jan 25 17:37:43 2016"

install.packages("gdata")
require(gdata)
ext <- read.xls ("ext.xls", sheet = 1, header = TRUE, stringsAsFactors=FALSE)
write.table(ext, file="extraw_initiative_20140902.csv", sep="," , col.names=TRUE, row.names=FALSE)

## without head
ext_csv1 <- ext[-c(1:5), ]
## remove first two colums 
ext_csv2 <- ext_csv1[, -c(1:2)] 
ext_csv3 <- ext_csv2[-c(2354:2377), ]
ext_csv4 <- ext_csv3[, -c(10:13) ]
dim(ext_csv4)
head(ext_csv4)
tail(ext_csv4)
write.table(ext_csv4, file="ext_initiative_20140902.csv", sep="," , col.names=TRUE, row.names=FALSE)

tail(ext_csv1, 30)
ext_csv5 <- ext_csv1[c(2358:2367), (1:7)]
ext_csv5$X.1 <- NULL
ext_csv5$X.2 <- NULL
dim(ext_csv5)
names(ext_csv5) <- c("gdenr_without_polling_station", "gdename_without_polling_station", "gdenr", "gdename", "gdekt")



