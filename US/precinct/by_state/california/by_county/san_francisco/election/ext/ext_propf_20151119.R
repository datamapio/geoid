## setwd("/Users/rogerfischer/datamap/geoid/US/precinct/by_state/california/by_county/san_francisco/election/ext")
## getwd()

## Download from http://www.sfelections.org/results/20151103/#english_detail
## Statement of the Vote: Excel Version
## https://raw.githubusercontent.com/datamapio/geoid/master/US/precinct/by_state/california/by_county/san_francisco/election/ext/ext_propf_20151119.csv

## file <- "https://raw.githubusercontent.com/datamapio/geoid/master/US/precinct/by_state/california/by_county/san_francisco/election/ext/ext_propf_20151119.csv"
## Read local copy
propf <- read.csv("ext_propf_20151119.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE, fileEncoding="UTF-8")

library(dplyr)
ext <- slice(propf, 4:797)

Turnout (%)	Yes	No	Under Vote	Over Vote
#PrecinctName  ReportingType	PrecinctID	Precincts	Registration	Ballots Cast	Turnout (%)	Yes	No	Under Vote	Over Vote
names(ext) <- c("precinct_names", "reporting_type", "polling_precinct", "no_of_precincts", "registered_to_vote", "ballots_cast", "turnout", "yes", "no", "under_vote", "over_vote")

ext$yes <- as.numeric(ext$yes)
ext$no <- as.numeric(ext$no)

vbm <- filter(ext, grepl('VBM', reporting_type))
elecday <- filter(ext, grepl('Election Day', reporting_type))

eld <- mutate(elecday,
       total = yes + no,
       yes_percentage = round((yes / total), 2),
       no_percentage = round((no / total), 2) )

write.table(eld, file="prop_f_election_day_20151103_20151119.csv", sep="," ,col.names=TRUE, row.names=FALSE)

