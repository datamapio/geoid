## setwd("/Users/rogerfischer/datamap/geoid/BE/municipality")
## getwd()
## list.files()
ref <- read.csv("RAW_belgium_municipality_2013.csv", header = TRUE, stringsAsFactors=FALSE, encoding = "UTF-8")

## code ins = code nis
names(ref) <- c("municipality_name_fr", "code_ins")
library(dplyr)

## Bruxelles-Capitale
brussels <- slice(ref, 5:23)
brussels$id <- paste("056B", brussels$code_ins, sep="")
brussels <- select(brussels, id, municipality_name_fr, code_ins)
write.table(brussels, "brussels_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Anvers, Arrondissement Anvers, Province Anvers, Région Flamande
arr_anvers <- slice(ref, 27:56)
arr_anvers$id <- paste("056F", arr_anvers$code_ins, sep="")
arr_anvers <- select(arr_anvers, id, municipality_name_fr, code_ins)
write.table(arr_anvers, "arrondissement_anvers_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Malines, Arrondissement Malines, Province Anvers, Région Flamande
arr_malines <- slice(ref, 58:70)
arr_malines$id <- paste("056F", arr_malines$code_ins, sep="")
arr_malines <- select(arr_malines, id, municipality_name_fr, code_ins)
write.table(arr_malines, "arrondissement_malines_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Turnhout, Province Anvers, Région Flamande
arr_turnhout <- slice(ref, 72:98)
arr_turnhout$id <- paste("056F", arr_turnhout$code_ins, sep="")
arr_turnhout <- select(arr_turnhout, id, municipality_name_fr, code_ins)
write.table(arr_turnhout, "arrondissement_turnhout_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Hal-Vilvorde, Province Brabant-Flamande, Région Flamande
arr_halvilvorde <- slice(ref, 101:135)
arr_halvilvorde$id <- paste("056F", arr_halvilvorde$code_ins, sep="")
arr_halvilvorde <- select(arr_halvilvorde, id, municipality_name_fr, code_ins)
write.table(arr_halvilvorde, "arrondissement_halvilvorde_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)


## Arrondissement Louvain, Province Brabant-Flamande, Région Flamande
arr_louvain <- slice(ref, 137:166)
arr_louvain$id <- paste("056F", arr_louvain$code_ins, sep="")
arr_louvain <- select(arr_louvain, id, municipality_name_fr, code_ins)
write.table(arr_louvain, "arrondissement_louvain_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)


## Arrondissement Bruges, Province de Flandre Occidentale, Région Flamande
arr_bruges <- slice(ref, 169:178)
arr_bruges$id <- paste("056F", arr_bruges$code_ins, sep="")
arr_bruges <- select(arr_bruges, id, municipality_name_fr, code_ins)
write.table(arr_bruges, "arrondissement_bruges_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Courtrai, Province de Flandre Occidentale, Région Flamande
arr_courtrai <- slice(ref, 180:191)
arr_courtrai$id <- paste("056F", arr_courtrai$code_ins, sep="")
arr_courtrai <- select(arr_courtrai, id, municipality_name_fr, code_ins)
write.table(arr_courtrai, "arrondissement_courtrai_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Dixmude, Province de Flandre Occidentale, Région Flamande
arr_dixmude <- slice(ref, 193:197)
arr_dixmude$id <- paste("056F", arr_dixmude$code_ins, sep="")
arr_dixmude <- select(arr_dixmude, id, municipality_name_fr, code_ins)
write.table(arr_dixmude, "arrondissement_dixmude_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Furnes, Province de Flandre Occidentale, Région Flamande
arr_furnes <- slice(ref, 199:203)
arr_furnes$id <- paste("056F", arr_furnes$code_ins, sep="")
arr_furnes <- select(arr_furnes, id, municipality_name_fr, code_ins)
write.table(arr_furnes, "arrondissement_furnes_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Ostende, Province de Flandre Occidentale, Région Flamande
arr_ostende <- slice(ref, 205:211)
arr_ostende$id <- paste("056F", arr_ostende$code_ins, sep="")
arr_ostende <- select(arr_ostende, id, municipality_name_fr, code_ins)
write.table(arr_ostende, "arrondissement_ostende_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)







