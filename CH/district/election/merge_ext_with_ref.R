## setwd("/Users/rogerfischer/datamap/geoid/CH/district/election")
## getwd()

## fileUrl = download URL; destfile = local file name, e.g. ext.xls
## Abst.-Nr.  597
fileUrl <- "http://www.bfs.admin.ch/bfs/portal/de/index/themen/17/03/blank/key/2016/012.Document.199650.xls"
download.file(fileUrl, destfile = "ext.xls", method = "curl")

## Always document the time of the download as the file content or location might change
dateDownloaded <- date()
dateDownloaded # "Mon Feb 29 11:07:27 2016"

## Install gdata
## install.packages("gdata")
library(gdata)
## Read first sheet in as data frame (df). 
## If the Excel has several sheets create ext1 for sheet=1, ext2 for sheet=2 etc.
ext <- read.xls ("ext.xls", sheet = 1, header = FALSE, stringsAsFactors=FALSE)

library(dplyr)
ext2 <- slice(ext, 8:162)
ext3 <- ext2[ , c(1:2, 8:11)]
names(ext3) <- c("gdebznr", "gdebzna","valid_votes","yes","no","yes_percentage" )

x <- ext3[, c(3:5)] 
x <- apply(x, 2, function(y) as.numeric(gsub(",", "", y)))
ext3[, c(3:5)] <- x
ext3$yes_percentage <- as.numeric(ext3$yes_percentage)

## 7 won't match with our GeoID file, because they are Swiss Abroad
## 75603009030 9030	LU-Ausland-CH
## 75610009100	9100	FR-CH de l'étranger
## 75617009170	9170	SG-Ausland-CH
## 75619009190	9190	AG-Ausland-CH
## 75620009200	9200	TG-Ausland-CH
## 75622009220	9220	VD-CH de l'étranger
## 75623009230	9230	VS-CH de l'étranger

ref <- read.csv("../ch_district_2016.csv", header = TRUE, stringsAsFactors=FALSE)
data <- merge(ref, ext3, by="gdebznr", all=TRUE)
data <- data[order(data$district_number), ] 

data2 <- select(data, id, gdebznr, district_name, valid_votes, yes, no, yes_percentage)

id_new <- c("75603009030", "75610009100", "75617009170", "75619009190", "75620009200", "75622009220", "75623009230" )
d_name_new <- c("LU-Ausland-CH", "FR-CH de l'étranger", "SG-Ausland-CH", "AG-Ausland-CH", "TG-Ausland-CH", "VD-CH de l'étranger", "VS-CH de l'étranger")

data2[149:155, 1] <- id_new
data2[149:155, 3] <- d_name_new
data3 <- select(data2, id, district_name, valid_votes, yes, no, yes_percentage)

write.table(data3, file="enforcement_initiative_ch_district_20160228_prov_with_swiss_abroad.csv", sep="," ,col.names=TRUE, row.names=FALSE)





