##REF for Places / here Main Cantonal Cities
## http://www.bfs.admin.ch/bfs/portal/en/index/regionen/thematische_karten/maps/raumgliederung/institutionelle_gliederungen.parsys.0002.PhotogalleryDownloadFile2.tmp/k00.22s.pdf

## setwd("/Users/rogerfischer/datamap/geoid/CH/city")
## getwd()

## Population by Municipality
## http://www.bfs.admin.ch/bfs/portal/de/index/themen/01/02/blank/key/bevoelkerungsstand/02.html

## Statistische Städte
## http://www.bfs.admin.ch/bfs/portal/de/index/regionen/11/geo/raeumliche_typologien/02.html
## http://www.bfs.admin.ch/bfs/portal/de/index/regionen/11/geo/raeumliche_typologien/02.Document.188799.xls


## Cantonal Main Cities
## https://github.com/datamapio/geoid/blob/master/CH/municipality/ch_municipality_2016.csv
75601120261 Zürich
75609001711 Zug
75623126266 Sion/Sitten
75622255586 Lausanne
75604001201 Altdorf
75621015002 Bellinzona

75620124566 Frauenfeld
75605061372 Schwyz
75611092601 Solothurn
75614032939 Schaffhausen
75617213203 St.Gallen
75606001407 Sarnen

75607001509 Stans
75624046458 Neuchâtel/Neuenburg
75603111061 Luzern
75626016711 Delémont/Delsberg
75618293901 Chur
75608001632 Glarus

75625006621 Genève/Genf
75610042196 Fribourg/Freiburg
75612002701 Basel
75613032829 Liestal
75602460351 Bern
75615013001 Herisau 
75616003101 Appenzell
75619014001 Aarau

ext_file <- "../municipality/ch_municipality_2016.csv"
ext <- read.csv(ext_file, header = TRUE, sep = ",", stringsAsFactors=FALSE) 

capitals  <- c("75601120261", "75609001711", "75623126266", "75622255586", "75604001201", "75621015002", "75620124566", "75605061372", "75611092601", "75614032939", "75617213203", "75606001407", "75607001509", "75624046458", "75603111061", "75626016711", "75618293901", "75608001632", "75625006621", "75610042196", "75612002701", "75613032829", "75602460351", "75615013001", "75616003101", "75619014001")

ext_capitals <-ext[(ext$id %in% capitals), ] 
library(dplyr)
capitals <- select(ext_capitals, id, municipality_number, municipality_name, canton_code)

write.table(capitals, file="ch_canton_capital.csv", sep="," ,col.names=TRUE, row.names=FALSE)


