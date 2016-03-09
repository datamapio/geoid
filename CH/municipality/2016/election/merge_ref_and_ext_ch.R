## setwd("/Users/rogerfischer/datamap/geoid/CH/municipality/2016/election")
## getwd()

## fileUrl = download URL; destfile = local file name, e.g. ext.xls
## http://www.bfs.admin.ch/bfs/portal/de/index/themen/17/03/blank/key/2016/012.html
fileUrl <- "http://www.bfs.admin.ch/bfs/portal/de/index/themen/17/03/blank/key/2016/012.Document.199661.xls"
download.file(fileUrl, destfile = "ext.xls", method = "curl")

## Always document the time of the download as the file content or location might change
dateDownloaded <- date()
dateDownloaded # "Wed Mar  9 13:19:19 2016"

library(gdata)
## Read first sheet in as data frame (df). 
## If the Excel has several sheets create ext1 for sheet=1, ext2 for sheet=2 etc.
ext <- read.xls ("ext.xls", sheet = 1, header = FALSE, stringsAsFactors=FALSE)

ext1 <- slice(ext, 7:2303)
ext1 <- select(ext1, 3:4, 10:13)
# Gemeinde-Nr. Gemeinden, Gültige, Ja-Stimmen, Nein-Stimmen, Ja in %
names(ext1) <- c("gdenr", "gdename", "valid_votes","yes", "no", "yes_percentage")

ext1$yes_percentage <- as.numeric(ext1$yes_percentage)
x <- ext1[, c(3:5)] 
x <- apply(x, 2, function(y) as.numeric(gsub(",", "", y)))
ext1[, c(3:5)] <- x


ref <- read.csv("../ch_municipality_2016.csv", header = TRUE, stringsAsFactors=FALSE, encoding = "UTF-8")

class(ext1$gdenr)
ext1$gdenr <- as.numeric(ext1$gdenr)
class(ref$gdenr)
check_ext <- select(ext1, gdenr)
check_ref <- select(ref, gdenr)

## install.packages("daff")
library("daff")
difference <- diff_data(check_ext, check_ref)

# ## 2014
# Gemeinden ohne eigenes Wahl-/Stimmbüro:                  Urnenstandort          
# Gemeinde-Nr.Gemeinde                    Gemeinde-Nr. Gemeinde    Kanton  
# 389 Meienried                           383      Büren              BE     
# 408 Hellsau                             410      Höchstetten        BE    
# 417 Niederösch                          405      Ersigen            BE    
# 419 Oberösch                            405      Ersigen            BE     
# 422 Rüti bei Lyssach                    416      Mötschwil          BE  
# 535 Deisswil bei Münchenbuchsee         553      Wiggiswil          BE    
# 661 Clavaleyres                         669      Münchenwiler       BE  
# 868 Jaberg                              872      Kirchdorf          BE    
# 877 Niedermuhlern                       888      Wald               BE  
# 878 Noflen                              872      Kirchdorf          BE     
# 
#
# In 2015  
# +++,389 Meienried
# +++,408 Hellsau
# +++,422 Rüti bei Lyssach
# +++,535 Deisswil bei Münchenbuchsee
# +++,661 Clavaleyres
# +++,868 Jaberg
# +++,877 Niedermuhlern
# +++,878 Noflen
# 
# Swiss Abroad
# ---,9030 
# ---,9040
# ---,9100
# ---,9120
# ---,9160
# ---,9170
# ---,9190
# ---,9200
# ---,9220
# ---,9230
#---,9250


ext1$gdename <- NULL ## we don't need the gdenr

data <- merge(ref, ext1, by="gdenr", all=TRUE)
write.table(data, "enforcement_initiative_ch_municipality_20160228.csv", sep="," , col.names=TRUE, row.names=FALSE)

