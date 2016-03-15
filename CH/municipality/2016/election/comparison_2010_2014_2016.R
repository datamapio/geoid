## setwd("/Users/rogerfischer/datamap/geoid/CH/municipality/2016/election")
## getwd()

i2016 <- read.csv("enforcement_initiative_ch_municipality_20160228.csv", header = TRUE, stringsAsFactors=FALSE, encoding = "UTF-8")
i2014 <- read.csv("../../2014/REAL_election_municipality_20140209.csv", header = TRUE, stringsAsFactors=FALSE, encoding = "UTF-8")
i2010 <- read.csv("../../2010/REAL_election_municipality_20101128.csv", header = TRUE, stringsAsFactors=FALSE, encoding = "UTF-8")

library(dplyr)
yes2016 <- select(i2016, id, municipality_name, yes_percentage)
yes2014 <- select(i2014, id, municipality_name, yes_percentage)
yes2010 <- select(i2010, id, municipality_name, yes_percentage)

m1 <- merge(yes2010, yes2014, by="id", all=TRUE)
m2 <- merge(m1, yes2016, by="id", all=TRUE)

m2$yes2010 <- as.numeric(m2$yes_percentage.x)
m2$yes2014 <- as.numeric(m2$yes_percentage.y)
m2$yes2016 <- as.numeric(m2$yes_percentage)
m2 <- select(m2, id, municipality_name, yes2010, yes2014, yes2016)

## Boxplot
boxplot(m2$yes2010, m2$yes2014, m2$yes2016, names=c("yes 2010", "yes 2014", "yes 2016"))


specify_decimal <- function(x, k) format(round(x, k), nsmall=k)

m2 <- mutate(m2,
       no_change2010_2014 = specify_decimal(as.numeric(yes2010 - yes2014), 1),
       no_change2014_2016 = specify_decimal(as.numeric(yes2014 - yes2016), 1),
       no_change2010_2016 = specify_decimal(as.numeric(yes2010 - yes2016), 1))

m2$no_change2010_2014 <- as.numeric(m2$no_change2010_2014)
m2$no_change2014_2016 <- as.numeric(m2$no_change2014_2016)
m2$no_change2010_2016 <- as.numeric(m2$no_change2010_2016)

m2 <- na.omit(m2)

q5_95 <- quantile(m2$change2010_2016, c(.05, .95)) 
# 5%  95% 
#-0.4 18.1 

lessSVP <- filter(m2, no_change2010_2016 >= 18.1)
lessSVP <- lessSVP[order(-lessSVP$no_change2010_2016), ]
moreSVP <- filter(m2, no_change2010_2016 <= -0.4)
moreSVP <- moreSVP[order(moreSVP$no_change2010_2016), ]

hist(as.numeric(m2$no_change2010_2016))

write.table(m2, "comparison_2010_2014_2016.csv", sep="," , col.names=TRUE, row.names=FALSE)







