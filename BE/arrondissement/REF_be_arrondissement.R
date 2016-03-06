## setwd("/Users/rogerfischer/datamap/geoid/BE/arrondissement")
## getwd()

ref <- read.csv("RAW_belgium_arrondissement_2013.csv", header = TRUE, stringsAsFactors=FALSE, encoding = "UTF-8")
ref2 <- read.csv("be_arrondissement_wikipedia.csv", header = TRUE, stringsAsFactors=FALSE, encoding = "UTF-8")

names(ref) <- c("arrondissement_name_fr", "code_nis_5")
##trim leading and trailing zeros function
trim <- function (x) gsub("0{3}$", "", x)

## apply trim function
ref$code_nis <- trim(ref$code_nis_5)

##Merge
ref3 <- merge(ref, ref2, by="code_nis")
library(dplyr)
ref3 <- select(ref3, code_nis, arr_name_nl, arr_name_fr, arrondissement_name_fr, code_hasc, code_nuts, code_nis_5)
write.table(ref3, "RAW_MERGE_be_arr_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)


## TO DO FROM DOWN HERE
#fla <- c(11, 12, 13, 23, 24, 31, 32, 33, 34, 35, 36, 37, 38, 41, 42, 43, 44, 45, 46, 71, 72, 73)
#
#createid <- function (x) ref3$id[ref3$code_nis == apply(x)] <- paste("056F", ref3$code_nis, sep="")
#for(i in fla) {
#  createid(i)
#}


ref$id <- c("056F1", "056F2", "056W2", "056F3", "056F4", "056W5", "056W6", "056F7", "056W8", "056W9")
ref$province_name <- c("Antwerp", "Flemish Brabant", "Walloon Brabant", "West Flanders", "East Flanders", "Hainaut", "Liège", "Limburg", "Luxembourg", "Namur")


