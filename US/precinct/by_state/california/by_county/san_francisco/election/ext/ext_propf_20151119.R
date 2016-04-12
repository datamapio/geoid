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