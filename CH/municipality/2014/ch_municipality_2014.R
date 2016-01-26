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

