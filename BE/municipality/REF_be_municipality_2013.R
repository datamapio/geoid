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

## Arrondissement Mons, Province du Hainaut, Région Wallonne
arr_mons <- slice(ref, 417:429)
arr_mons$id <- paste("056W", arr_mons$code_ins, sep="")
arr_mons <- select(arr_mons, id, municipality_name_fr, code_ins)
write.table(arr_mons, "arrondissement_mons_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Mouscron, Province du Hainaut, Région Wallonne
arr_mouscron <- slice(ref, 431:432)
arr_mouscron$id <- paste("056W", arr_mouscron$code_ins, sep="")
arr_mouscron <- select(arr_mouscron, id, municipality_name_fr, code_ins)
write.table(arr_mouscron, "arrondissement_mouscron_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Soignies, Province du Hainaut, Région Wallonne
arr_soignies <- slice(ref, 434:441)
arr_soignies$id <- paste("056W", arr_soignies$code_ins, sep="")
arr_soignies <- select(arr_soignies, id, municipality_name_fr, code_ins)
write.table(arr_soignies, "arrondissement_soignies_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Thuin, Province du Hainaut, Région Wallonne
arr_thuin <- slice(ref, 443:456)
arr_thuin$id <- paste("056W", arr_thuin$code_ins, sep="")
arr_thuin <- select(arr_thuin, id, municipality_name_fr, code_ins)
write.table(arr_thuin, "arrondissement_thuin_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Tournai, Province du Hainaut, Région Wallonne
arr_tournai <- slice(ref, 458:467)
arr_tournai$id <- paste("056W", arr_tournai$code_ins, sep="")
arr_tournai <- select(arr_tournai, id, municipality_name_fr, code_ins)
write.table(arr_tournai, "arrondissement_tournai_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Huy, Province de Liège, Région Wallonne
arr_huy <- slice(ref, 470:486)
arr_huy$id <- paste("056W", arr_huy$code_ins, sep="")
arr_huy <- select(arr_huy, id, municipality_name_fr, code_ins)
write.table(arr_huy, "arrondissement_huy_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Liège, Province de Liège, Région Wallonne
arr_liege <- slice(ref, 488:511)
arr_liege$id <- paste("056W", arr_liege$code_ins, sep="")
arr_liege <- select(arr_liege, id, municipality_name_fr, code_ins)
write.table(arr_liege, "arrondissement_liege_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Verviers, Province de Liège, Région Wallonne
arr_verviers <- slice(ref, 513:541)
arr_verviers$id <- paste("056W", arr_verviers$code_ins, sep="")
arr_verviers <- select(arr_verviers, id, municipality_name_fr, code_ins)
write.table(arr_verviers, "arrondissement_verviers_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Waremme, Province de Liège, Région Wallonne
arr_waremme <- slice(ref, 543:556)
arr_waremme$id <- paste("056W", arr_waremme$code_ins, sep="")
arr_waremme <- select(arr_waremme, id, municipality_name_fr, code_ins)
write.table(arr_waremme, "arrondissement_waremme_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Arlon, Province du Luxembourg, Région Wallonne
arr_arlon <- slice(ref, 559:563)
arr_arlon$id <- paste("056W", arr_arlon$code_ins, sep="")
arr_arlon <- select(arr_arlon, id, municipality_name_fr, code_ins)
write.table(arr_arlon, "arrondissement_arlon_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Bastogne, Province du Luxembourg, Région Wallonne
arr_bastogne <- slice(ref, 565:572)
arr_bastogne$id <- paste("056W", arr_bastogne$code_ins, sep="")
arr_bastogne <- select(arr_bastogne, id, municipality_name_fr, code_ins)
write.table(arr_bastogne, "arrondissement_bastogne_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Marche-en-Famenne, Province du Luxembourg, Région Wallonne
arr_marcheenfamenne <- slice(ref, 574:582)
arr_marcheenfamenne$id <- paste("056W", arr_marcheenfamenne$code_ins, sep="")
arr_marcheenfamenne <- select(arr_marcheenfamenne, id, municipality_name_fr, code_ins)
write.table(arr_marcheenfamenne, "arrondissement_marcheenfamenne_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Neufchâteau, Province du Luxembourg, Région Wallonne
arr_neufchateau <- slice(ref, 584:595)
arr_neufchateau$id <- paste("056W", arr_neufchateau$code_ins, sep="")
arr_neufchateau <- select(arr_neufchateau, id, municipality_name_fr, code_ins)
write.table(arr_neufchateau, "arrondissement_neufchateau_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement  Virton, Province du Luxembourg, Région Wallonne
arr_virton <- slice(ref, 597:606)
arr_virton$id <- paste("056W", arr_virton$code_ins, sep="")
arr_virton <- select(arr_virton, id, municipality_name_fr, code_ins)
write.table(arr_virton, "arrondissement_virton_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Dinant, Province de Namur, Région Wallonne
arr_dinant <- slice(ref, 609:623)
arr_dinant$id <- paste("056W", arr_dinant$code_ins, sep="")
arr_dinant <- select(arr_dinant, id, municipality_name_fr, code_ins)
write.table(arr_dinant, "arrondissement_dinant_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Namur, Province de Namur, Région Wallonne
arr_namur <- slice(ref, 625:640)
arr_namur$id <- paste("056W", arr_namur$code_ins, sep="")
arr_namur <- select(arr_namur, id, municipality_name_fr, code_ins)
write.table(arr_namur, "arrondissement_namur_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

## Arrondissement Philippeville, Province de Namur, Région Wallonne
arr_philippeville <- slice(ref, 642:648)
arr_philippeville$id <- paste("056W", arr_philippeville$code_ins, sep="")
arr_philippeville <- select(arr_philippeville, id, municipality_name_fr, code_ins)
write.table(arr_philippeville, "arrondissement_philippeville_municipality_2013.csv", sep="," , col.names=TRUE, row.names=FALSE)

arr_list <- list()
arr_list <- ls()
arr_list <- arr_list[-c(45, 46)] 
arr_list <- lapply(arr_list, function(x) as.name(x))


library(data.table)
be_municipality <- rbindlist(arr_list)
be_municipality <- rbind_all(arr_list)







