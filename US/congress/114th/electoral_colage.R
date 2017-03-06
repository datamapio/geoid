setwd("/Users/una/GitHub/US/electoral_college/2016/REF")
getwd()
ref <- read.csv ("electoral_votes_2016.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE, colClasses='character')
ref_states<- read.csv ("us_state_congressionalvote.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE, colClasses='character')
library(dplyr)
require(stringr)
ref$state_fips <- str_sub(ref$id,10,11)
ref_states$state_fips <- str_pad(ref_states$state_fips, width=2, side="left", pad="0")


write.table(ref, file="REF_electoral_votes_2016.csv", sep="," ,col.names=TRUE, row.names=FALSE)

write.table(ref_states, file="us_state_congressionalvote.csv", sep="," ,col.names=TRUE, row.names=FALSE)
