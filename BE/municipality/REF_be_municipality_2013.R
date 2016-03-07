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

## Arrondissement Roulers, Province de Flandre Occidentale, Région Flamande
arr_roulers <- slice(ref, 213:220)
arr_roulers$id <- paste("056F", arr_roulers$code_ins, sep="")
arr_roulers <- select(arr_roulers, id, municipality_name_fr, code_ins)
write.table(arr_roulers, "arrondissement_roulers_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Tielt, Province de Flandre Occidentale, Région Flamande
arr_tielt <- slice(ref, 222:230)
arr_tielt$id <- paste("056F", arr_tielt$code_ins, sep="")
arr_tielt <- select(arr_tielt, id, municipality_name_fr, code_ins)
write.table(arr_tielt, "arrondissement_tielt_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Ypres, Province de Flandre Occidentale, Région Flamande
arr_ypres <- slice(ref, 232:239)
arr_ypres$id <- paste("056F", arr_ypres$code_ins, sep="")
arr_ypres <- select(arr_ypres, id, municipality_name_fr, code_ins)
write.table(arr_ypres, "arrondissement_ypres_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Alost, Province de Flandre Orientale, Région Flamande
arr_alost <- slice(ref, 242:251)
arr_alost$id <- paste("056F", arr_alost$code_ins, sep="")
arr_alost <- select(arr_alost, id, municipality_name_fr, code_ins)
write.table(arr_alost, "arrondissement_alost_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Audenarde, Province de Flandre Orientale, Région Flamande
arr_audenarde <- slice(ref, 253:263)
arr_audenarde$id <- paste("056F", arr_audenarde$code_ins, sep="")
arr_audenarde <- select(arr_audenarde, id, municipality_name_fr, code_ins)
write.table(arr_audenarde, "arrondissement_audenarde_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Eeklo, Province de Flandre Orientale, Région Flamande
arr_eeklo <- slice(ref, 265:270)
arr_eeklo$id <- paste("056F", arr_eeklo$code_ins, sep="")
arr_eeklo <- select(arr_eeklo, id, municipality_name_fr, code_ins)
write.table(arr_eeklo, "arrondissement_eeklo_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Gand, Province de Flandre Orientale, Région Flamande
arr_gand <- slice(ref, 272:292)
arr_gand$id <- paste("056F", arr_gand$code_ins, sep="")
arr_gand <- select(arr_gand, id, municipality_name_fr, code_ins)
write.table(arr_gand, "arrondissement_gand_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Saint-Nicolas, Province de Flandre Orientale, Région Flamande
arr_saintnicolas <- slice(ref, 294:300)
arr_saintnicolas$id <- paste("056F", arr_saintnicolas$code_ins, sep="")
arr_saintnicolas <- select(arr_saintnicolas, id, municipality_name_fr, code_ins)
write.table(arr_saintnicolas, "arrondissement_saintnicolas_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Termonde, Province de Flandre Orientale, Région Flamande
arr_termonde <- slice(ref, 302:311)
arr_termonde$id <- paste("056F", arr_termonde$code_ins, sep="")
arr_termonde <- select(arr_termonde, id, municipality_name_fr, code_ins)
write.table(arr_termonde, "arrondissement_termonde_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Hasselt, Province du Limbourg, Région Flamande
arr_hasselt <- slice(ref, 314:331)
arr_hasselt$id <- paste("056F", arr_hasselt$code_ins, sep="")
arr_hasselt <- select(arr_hasselt, id, municipality_name_fr, code_ins)
write.table(arr_hasselt, "arrondissement_hasselt_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Maaseik, Province du Limbourg, Région Flamande
arr_maaseik <- slice(ref, 333:345)
arr_maaseik$id <- paste("056F", arr_maaseik$code_ins, sep="")
arr_maaseik <- select(arr_maaseik, id, municipality_name_fr, code_ins)
write.table(arr_maaseik, "arrondissement_maaseik_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Tongres, Province du Limbourg, Région Flamande
arr_tongres <- slice(ref, 347:359)
arr_tongres$id <- paste("056F", arr_tongres$code_ins, sep="")
arr_tongres <- select(arr_tongres, id, municipality_name_fr, code_ins)
write.table(arr_tongres, "arrondissement_tongres_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Nivelles, Province du Brabant Wallon, Région Wallonne
arr_nivelles <- slice(ref, 364:390)
arr_nivelles$id <- paste("056W", arr_nivelles$code_ins, sep="")
arr_nivelles <- select(arr_nivelles, id, municipality_name_fr, code_ins)
write.table(arr_nivelles, "arrondissement_nivelles_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Ath, Province du Hainaut, Région Wallonne
arr_ath <- slice(ref, 393:400)
arr_ath$id <- paste("056W", arr_ath$code_ins, sep="")
arr_ath <- select(arr_ath, id, municipality_name_fr, code_ins)
write.table(arr_ath, "arrondissement_ath_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Charleroi, Province du Hainaut, Région Wallonne
arr_charleroi <- slice(ref, 402:415)
arr_charleroi$id <- paste("056W", arr_charleroi$code_ins, sep="")
arr_charleroi <- select(arr_charleroi, id, municipality_name_fr, code_ins)
write.table(arr_charleroi, "arrondissement_charleroi_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)




