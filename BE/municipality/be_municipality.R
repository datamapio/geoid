## setwd("/Users/rogerfischer/datamap/geoid/BE/municipality")
## getwd()

## fileUrl = download URL; destfile = local file name, e.g. ext.xls
fileUrl <- "http://statbel.fgov.be/fr/binaries/INS-code_tcm326-193255.xls"
download.file(fileUrl, destfile = "ext.xls", method = "curl")

## Always document the time of the download as the file content or location might change
dateDownloaded <- date()
dateDownloaded # "Mon Feb  8 11:29:42 2016"

## Install gdata
install.packages("gdata")
library(gdata)
## Read first sheet in as data frame (df). 
## If the Excel has several sheets create ext1 for sheet=1, ext2 for sheet=2 etc.
ext <- read.xls ("ext.xls", sheet = 1, header = FALSE, stringsAsFactors=FALSE)

write.table(ext, file="RAW_belgium_municipality_2013.csv", sep="," ,col.names=TRUE, row.names=FALSE)

Bruxelles: 8:26
Province of Anvers
Arr. Anvers: 33:62
Arr. Malines: 65:77
Arr. Turnhout: 80:106

Province de Brabant Flamande
Arr. Hal-Vilvorde: 111:145
Arr. Louvain: 148:177

Province de Flandre Occidentale
Arr. de Bruges: 182:191
Arr. de Coutrai: 194:205
Arr. de Dixmude: 208:212
Arr. de Furnes: 215:219
Arr. de Malines: 

## ARRONDISSEMENT
arr <- "Arrondissement"
ext_arrondissement <- ext[grepl(arr, ext$V1),]
dim(ext_arrondissement) ##41 not 43 => Liège (62), Neufchâteau (84) is missing
#487 Arrondissement de Li\xe8ge 62000
liege <- ext[grepl(62000, ext$V2), ]
#583 Arrondissement de Neufch\xe2teau 84000
neufchateau <- ext[grepl(84000, ext$V2), ]
missvalues <- rbind(liege,neufchateau) 
ext_arrondissement <- rbind(ext_arrondissement, missvalues)
ext_arrondissement <- ext_arrondissement[order(ext_arrondissement$V2), ]
write.table(ext_arrondissement, file="../arrondissement/RAW_belgium_arrondissement_2013.csv", sep="," ,col.names=TRUE, row.names=FALSE)

## PROVINCE
ext_prov_v <- grepl(pattern = "Province", x = ext$V1)
ext_province <- ext[ext_prov_v, ] # Liege is missing again
liege_province <- ext[grepl(60000, ext$V2), ]
ext_province <- rbind(ext_province, liege_province)
ext_province <- ext_province[order(ext_province$V2), ]
write.table(ext_province, file="../province/RAW_belgium_province_2013.csv", sep="," ,col.names=TRUE, row.names=FALSE)

