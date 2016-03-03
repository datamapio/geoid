## setwd("/Users/rogerfischer/datamap/geoid/CH/municipality/2016/election")
## getwd()

## BE
## http://www.sta.be.ch/sta/de/index/wahlen-abstimmungen/wahlen-abstimmungen/abstimmungen/ergebnisse_abstimmungen/2016.html

fileUrl <- "http://www.sta.be.ch/sta/de/index/wahlen-abstimmungen/wahlen-abstimmungen/abstimmungen/ergebnisse_abstimmungen/2016.assetref/dam/documents/STA/AZD/de/abstimmungen/abstimmungsergebnisse/2016/wahlenabstimmungen-2016-02-28-ergebnis-eidg.csv"
download.file(fileUrl, destfile = "ext_be.csv", method = "curl")

## Always document the time of the download as the file content or location might change
dateDownloaded <- date()
dateDownloaded # "Tue Mar  1 14:10:57 2016"

ext_be <- read.csv("ext_be.csv", stringsAsFactors=FALSE)

library(dplyr)
jura_be <- c(28:67)
biel <- c(76:94)
seeland <- c(103:143)
oberaargau <- c(152:197)
emmental <- c(206:243)
bern <- c(252:333) 
# +2
thun <- c(342:373)
obersi <- c(382:388)
frutigen <- c(397:409)
interlaken <- c(418:445)

x <- c(jura_be, biel, seeland, oberaargau, emmental, bern, thun, obersi, frutigen, interlaken)
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

## Jaberg and Noflen vote in Kirchdorf; => We have to swap Noflen with Kirchdorf
## 868 Jaberg                              872      Kirchdorf          BE    
## 878 Noflen                              872      Kirchdorf          BE      
kirchdorf <- ext_be2[214, ]
ext_be2[214, 1] <- "Noflen"
noflen <- ext_be2[216, ]
ext_be2[216, 1] <- "Kirchdorf"


z <- ext_be2[, c(2:19)] 
## Check for NA's with => which (is.na(z))
percent <- z[, c(2, 5:6, 9:10, 13:14, 17:18)]
percent <- apply(percent, 2, function(y) as.numeric(gsub("%", "", y)))
z[, c(2, 5:6, 9:10, 13:14, 17:18)] <- percent

highcomma <- z[, c(1, 3:4, 7:8, 11:12, 15:16)]
highcomma <- apply(highcomma, 2, function(y) as.numeric(gsub("'", "", y)))
z[, c(1, 3:4, 7:8, 11:12, 15:16)] <- highcomma
ext_be2[, c(2:19)] <- z

## dim(ext_be2)
346  19
## summary(ext_be2) regarding Enforcement Initiative
#yes_e              no_e           yes_e_pct        no_e_pct         
#Min.   :   11.0   Min.   :    8.0   Min.   :17.30   Min.   : 9.80     
#1st Qu.:  138.8   1st Qu.:  110.0   1st Qu.:44.50   1st Qu.:42.25   
#Median :  288.5   Median :  245.0   Median :51.05   Median :48.95    
#Mean   :  519.6   Mean   :  774.9   Mean   :51.28   Mean   :48.72    
#3rd Qu.:  600.5   3rd Qu.:  619.5   3rd Qu.:57.75   3rd Qu.:55.50    
#Max.   :10193.0   Max.   :48602.0   Max.   :90.20   Max.   :82.70    
#NA's   :2         NA's   :2         NA's   :2       NA's   :2  

write.table(ext_be2, file="ext_be_final.csv", sep="," ,col.names=TRUE, row.names=FALSE)


## MERGE ON MUNICIPALITY NAME (NOT GREAT!!!)
## We reread the file (=ext_be2)

ext_bern <- read.csv("ext_be_final.csv", header = TRUE, stringsAsFactors=FALSE, encoding = "UTF-8")
ref <- read.csv("../ch_municipality_2016.csv", header = TRUE, stringsAsFactors=FALSE, encoding = "UTF-8")
ref_bern <- ref[ref$canton_code == "BE", ]

## Checking if I can force the conversion from ISO-8859-1 to UTF-8
write.table(ref_bern, file="bern_municipality_2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)
ref_bern2 <- read.csv("bern_municipality_2016.csv", header = TRUE, stringsAsFactors=FALSE, encoding = "UTF-8")
ref_bern2 <- select(ref_bern2, id, municipality_name)
ref_bern2 <- ref_bern2[order(ref_bern2$municipality_name, na.last = TRUE), ]
write.table(ref_bern2, file="bern_municipality_2016_minimal.csv", sep="," ,col.names=TRUE, row.names=FALSE)

ext_bern <- ext_bern[order(ext_bern$municipality_name, na.last = TRUE), ]
ext_bern2 <- ext_bern[-1, ]

##test2 <- cbind(ref_bern2, ext_bern2)


## install.packages("stringi")
library(stringi)
ref_bern$municipality_name <-  stri_enc_toutf8(ref_bern$municipality_name,  is_unknown_8bit = TRUE)
ref_bern <- ref_bern[order(ref_bern$municipality_name, na.last = TRUE), ]

ext_bern$municipality_name <- stri_enc_toutf8(ext_bern$municipality_name, is_unknown_8bit = TRUE)
ext_bern <- ext_bern[order(ext_bern$municipality_name, na.last = TRUE), ]

test <- merge(ref_bern2, ext_bern, by="municipality_name", all=TRUE)


