## setwd("/Users/rogerfischer/datamap/geoid/CH/municipality/2010")
## getwd()

## Download municipality date from the vote
## http://www.bfs.admin.ch/bfs/portal/de/index/themen/17/03/blank/key/2010/05.html
## 565 KB  Volksinitiative «Für die Ausschaffung krimineller Ausländer», nach Gemeinden
## (je-d-17.03.02.04.ed.552.1.c)
## Bundesamt für Statistik BFS
## 28.11.2010

fileUrl <- "http://www.bfs.admin.ch/bfs/portal/de/index/themen/17/03/blank/key/2010/05.Document.142036.xls"
download.file(fileUrl, destfile = "ext.xls", method = "curl")

dateDownloaded <- date()
dateDownloaded # "Sat Feb 20 10:16:56 2016"

## install.packages("gdata")
require(gdata)
ext <- read.xls ("ext.xls", sheet = 1, header = TRUE, stringsAsFactors=FALSE)

## without head
ext1 <- ext[-c(1:6), ]
## remove first two colums 
ext2 <- ext1[, -c(1:2)] 
## remove columns
ext3 <- ext2[, -c(11:25) ]
## remove unnecessary rows at the end
ext4 <- ext3[-c(2583:2597), ]

dim(ext4)
head(ext4)
## X.1 = Gemeindenummer (gdenr)
## X.2. = Gemeindename (gdename)
## X.3 = Stimmberechtigte = entitled_to_vote
## X.4 = Abgegebene Stimmen = votes_cast
## X.5 = Stimmbeteiligung = turnout
## X.6 = Gültige Stimmen = valid_votes
## Ohne gültige Antwort
## X.7 = JA-Stimmen = yes
## X.8 = NEIN-Stimmen = no
## X.9 = JA-Stimmen in Prozent = yes_percentage

## Exclude column 7, Ohne gültige Antwort
ext5 <- ext4[, -c(7)] 


names(ext5) <- c("gdenr", "gdename", "entitled_to_vote", "votes_cast", "turnout", "valid_votes", "yes", "no", "yes_percentage")
write.table(ext5, file="ext_initiative_20101128.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Delete Swiss Abroad
tail(ext5,9)
ext6 <- ext5[-(2574:2582), ]
tail(ext6) 
write.table(ext6, file="ext_initiative_20101128_without_swiss_abroad.csv", sep="," , col.names=TRUE, row.names=FALSE)


##NOT USED YET

## Compare g1, g2, g3 (from shapefiles) with results (ext6)

## If you don't have glg14.csv locally, use:
## https://github.com/datamapio/geoid/blob/master/CH/municipality/2010/G1G10.csv 
## https://github.com/datamapio/geoid/blob/master/CH/municipality/2010/G2G10.csv  
## https://github.com/datamapio/geoid/blob/master/CH/municipality/2010/G3G10.csv  
## file1 <- "https://raw.githubusercontent.com/datamapio/geoid/master/CH/municipality/2010/G1G10.csv" 
## file2 <- "https://raw.githubusercontent.com/datamapio/geoid/master/CH/municipality/2010/G2G10.csv"
## file3 <- "https://raw.githubusercontent.com/datamapio/geoid/master/CH/municipality/2010/G2G10.csv"

g1g10 <- read.csv("G1G10.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE) 
g2g10 <- read.csv("G2G10.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE) 
g3g10 <- read.csv("G3G10.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE)

## Comparing G1, G2, G3 first
## install.packages("daff")
library("daff")
diff1_2 <- diff_data(g1g10, g2g10)
diff2_3 <- diff_data(g2g10, g3g10)

diff





## Just seeing that GDENR and GMDNR are both in use for municipality numbers
## GDENR
## https://github.com/datamapio/geoid/blob/master/CH/municipality/ch_municipality_2016_source.csv
## GMDNR
## https://raw.githubusercontent.com/datamapio/geoid/master/CH/municipality/2014/g1g14.csv

glg14 <- read.csv("g1g14.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE) 
require(dplyr)

## Keep only two columns and rename
glg14_s <- select(glg14, GMDNR)
names(glg14_s) <- c("gdenr")
ext_csv9_s <- select(ext_csv9, gdenr)
ext_csv9_s$gdenr <- as.integer(ext_csv9_s$gdenr)

## install.packages("daff")
library("daff")
diff_data(ext_csv9_s, glg14_s)


## Are part of glg14, but not part of election data
## +++,2391 Staatswald Galm (O inhabitants)- not part of any municipality (Canton of Freiburg)
## https://de.wikipedia.org/wiki/Staatswald_Galm

## +++,5391 Comunanza Cadenazzo/Monteceneri (0 inhabitants), part of Cadenazzo & Monteceneri
## https://it.wikipedia.org/wiki/Comunanza_Cadenazzo/Monteceneri

## +++,5394 Comunanza Capriasca/Lugano (0 inhabitants) part of Capriasca and Lugano
## https://de.wikipedia.org/wiki/Kommunanz_Capriasca/Lugano

## +++,6391 Kommunanz Reckingen-Gluringen/Grafschaft (0 inhabitants), part of Reckingen-Gluringen 
## and Grafschaft VS in Obergoms
## https://de.wikipedia.org/wiki/Kommunanz_Reckingen-Gluringen/Grafschaft




