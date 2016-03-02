## setwd("/Users/rogerfischer/datamap/geoid/CH/municipality/2016/election")
## getwd()

## BE
## http://www.sta.be.ch/sta/de/index/wahlen-abstimmungen/wahlen-abstimmungen/abstimmungen/ergebnisse_abstimmungen/2016.html

fileUrl <- "http://www.sta.be.ch/sta/de/index/wahlen-abstimmungen/wahlen-abstimmungen/abstimmungen/ergebnisse_abstimmungen/2016.assetref/dam/documents/STA/AZD/de/abstimmungen/abstimmungsergebnisse/2016/wahlenabstimmungen-2016-02-28-ergebnis-eidg.csv"
download.file(fileUrl, destfile = "ext_be.csv", method = "curl")

## Always document the time of the download as the file content or location might change
dateDownloaded <- date()
dateDownloaded # "Tue Mar  1 14:10:57 2016"

## Install gdata
## install.packages("gdata")
library(gdata)
## Read first sheet in as data frame (df). 
## If the Excel has several sheets create ext1 for sheet=1, ext2 for sheet=2 etc.
## ext_be <- read.csv("ext_be.csv", sep=";", header = TRUE, stringsAsFactors=FALSE)
ext_be <- read.csv("ext_be.csv", stringsAsFactors=FALSE)

library(dplyr)
x <- c(11:20, 29:68, 77:95, 104:144, 153:198, 207:244, 253:332, 341:372, 381:387, 396:408, 417:444)
ext_be1 <- slice(ext_be, x)
names(ext_be1) <- "column1"
library(tidyr)
# m = mariage = Volksinitiative «Für Ehe und Familie - gegen die Heiratsstrafe» ; 
# e = enforcement = Volksinitiative «Zur Durchsetzung der Ausschaffung krimineller Ausländer (Durchsetzungsinitiative)» 
# f = food = Volksinitiative «Keine Spekulation mit Nahrungsmitteln!» 
# r = road = Änderung des Bundesgesetzes über den Strassentransitverkehr im Alpengebiet (Sanierung Gotthard-Strassentunnel)
#Verwaltungskreis;Stimmber.;Stimmbet.; Ja;Nein;Ja;Nein;             Ja;Nein;Ja;Nein;             Ja;Nein;Ja;Nein;            Ja;Nein;Ja;Nein ;  	
# Biel/Bienne; 62'590; 55.9%;            15'881;18'399;46.3%;53.7%;   12'854;22'116;36.8%;63.2%;   15'888;17'948;47.0%;53.0%;   19'456;15'036;56.4%;43.6% ;

i <- c("municipality_name", "entitled_to_vote","turnout", "yes_m", "no_m", "yes_m_pct", "no_m_pct", "yes_e", "no_e", "yes_e_pct", "no_e_pct", "yes_f", "no_f", "yes_f_pct", "no_f_pct", "yes_r", "no_r", "yes_r_pct", "no_r_pct")
## ext_be2 <- separate(as.matrix(ext_be1), col="column1", into=i , sep=";")

temp  <- strsplit(ext_be1$column1, ";")
ncol = max(sapply(temp,length))
library(data.table)
ext_be2 <- as.data.table(lapply(1:ncol,function(i)sapply(temp,"[",i)))
ext_be2 <- as.data.frame(ext_be2)
names(ext_be2) <- i

write.table(ext_be1, file="ext_be2.csv", sep="," ,col.names=TRUE, row.names=FALSE)







