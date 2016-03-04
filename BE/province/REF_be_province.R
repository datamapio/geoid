## setwd("/Users/rogerfischer/datamap/geoid/BE/province")
## getwd()

Type: Alphanumeric, 5
Country (3, numeric, ISO) | Region Code (1, alphabetic) | Province Code (1, numeric)
056 | W | 2
Ex. 056W2 = Brabant wallon
Ex. 056F2 = Vlaams-Brabant
Ex. 056F4 = Flandres Orientale
Note: We use the alphabet to keep the link to the province numbers.

ref <- read.csv("RAW_belgium_province_2013.csv", header = TRUE, stringsAsFactors=FALSE, encoding = "UTF-8")

ref$id <- c("056F1", "056F2", "056W2", "056F3", "056F4", "056W5", "056W6", "056F7", "056W8", "056W9")
names(ref) <- c("province_name_fr", "code_ins", "id")

ref$province_name <- c("Antwerp", "Flemish Brabant", "Walloon Brabant", "West Flanders", "East Flanders", "Hainaut", "Liège", "Limburg", "Luxembourg", "Namur")
ref$province_name_nl <- c("Antwerpen", "Vlaams-Brabant", "Waals-Brabant", "West-Vlaanderen", "Oost-Vlaanderen", "Henegouwen", "Luik", "Limburg", "Luxemburg", "Namen")
ref$province_name_fr <- c("Anvers", "Brabant Flamand", "Brabant Wallon", "Flandre Occidentale", "Flandre Orientale", "Hainaut", "Liège", "Limbourg", "Luxembourg", "Namur")
ref$province_name_de <- c("Antwerpen", "Flämisch-Brabant", "Wallonisch-Brabant", "Westflandern", "Ostflandern", "Hennegau", "Lüttich", "Limburg", "Luxemburg", "Namür")

library(dplyr)
ref <- select(ref, id, province_name, province_name_fr, province_name_nl, province_name_de, code_ins)

write.table(ref, file="be_province_2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)


