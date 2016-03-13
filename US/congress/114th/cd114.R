## setwd("/Users/rogerfischer/datamap/geoid/US/congress/114th")
## getwd()

fileUrl <- "https://raw.githubusercontent.com/datamapio/datamap-mvp/delegates/files/R/us_congressional_district_114_ref.csv?token=AHVy5InC8LWFbWXosREXeVMcLXkdBiuMks5W7IgGwA%3D%3D"
download.file(fileUrl, destfile = "ext.csv", method = "curl")
ext <- read.csv("ext.csv", header = TRUE, stringsAsFactors=FALSE, encoding = "UTF-8")

ext <- ext[order(ext$id), ]
library(dplyr)
ext <- select(ext, id, cd114_name = cd_name, geoid2=geoid, state_fips, cd114_fips, lsad, cdsessn)
ext <-ext[!(ext$cd114_fips =="ZZ"),]
ext$cd114_code <- NA ## "AL-1"

## Possible Extensions
## ext$cd114_area <- NA ## "Southwestern Corner: Mobile"
## ext$cd114_representative <- NA ## "Bradley Byrne"
## ext$cd114_party <- NA ## R
## ext$cook_pvi_2016 <- NA ## R+15
    
alabama <- ext[ext$state_fips == "1", ] 
alabama$cd114_name <- paste("Alabama", alabama$cd114_name, sep=" ")
alabama$cd114_code <- paste("AL", alabama$cd114_fips, sep="-" )
ext[1:7, ] <- alabama

alaska <- ext[ext$state_fips == "2", ] 
alaska$cd114_name <- paste("Alaska", alaska$cd114_name, sep=" ")
alaska$cd114_code <- "AK-AL"
ext[8, ] <- alaska

arizona <- ext[ext$state_fips == "4", ] 
arizona$cd114_name <- paste("Arizona", arizona$cd114_name, sep=" ")
arizona$cd114_code <- paste("AZ", arizona$cd114_fips, sep="-" )
ext[9:17, ] <- arizona

arkansas <- ext[ext$state_fips == "5", ] 
arkansas$cd114_name <- paste("Arkansas", arkansas$cd114_name, sep=" ")
arkansas$cd114_code <- paste("AR", arkansas$cd114_fips, sep="-" )
ext[18:21, ] <- arkansas

california <- ext[ext$state_fips == "6", ] 
california$cd114_name <- paste("California", california$cd114_name, sep=" ")
california$cd114_code <- paste("CA", california$cd114_fips, sep="-" )
ext[22:74, ] <- california

colorado <- ext[ext$state_fips == "8", ] 
colorado$cd114_name <- paste("Colorado", colorado$cd114_name, sep=" ")
colorado$cd114_code <- paste("CO", colorado$cd114_fips, sep="-" )
ext[75:81, ] <- colorado

connecticut <- ext[ext$state_fips == "9", ] 
connecticut$cd114_name <- paste("Connecticut", connecticut$cd114_name, sep=" ")
connecticut$cd114_code <- paste("CT", connecticut$cd114_fips, sep="-" )
ext[82:86, ] <- connecticut

delaware <- ext[ext$state_fips == "10", ] 
delaware$cd114_name <- paste("Delaware", delaware$cd114_name, sep=" ")
delaware$cd114_code <- "DE-AL"
ext[87, ] <- delaware

dc <- ext[ext$state_fips == "11", ] 
dc$cd114_name <- paste("DC", dc$cd114_name, sep=" ")
dc$cd114_code <- "Non Voting Member"
ext[88, ] <- dc

florida <- ext[ext$state_fips == "12", ] 
florida$cd114_name <- paste("Florida", florida$cd114_name, sep=" ")
florida$cd114_code <- paste("FL", florida$cd114_fips, sep="-" )
ext[89:115, ] <- florida

georgia <- ext[ext$state_fips == "13", ] 
georgia$cd114_name <- paste("Georgia", georgia$cd114_name, sep=" ")
georgia$cd114_code <- paste("GA", georgia$cd114_fips, sep="-" )
ext[116:129, ] <- georgia

hawaii <- ext[ext$state_fips == "15", ] 
hawaii$cd114_name <- paste("Hawaii", hawaii$cd114_name, sep=" ")
hawaii$cd114_code <- paste("HI", hawaii$cd114_fips, sep="-" )
ext[130:131, ] <- hawaii

idaho <- ext[ext$state_fips == "16", ] 
idaho$cd114_name <- paste("Idaho", idaho$cd114_name, sep=" ")
idaho$cd114_code <- paste("ID", idaho$cd114_fips, sep="-" )
ext[132:133, ] <- idaho

illinois  <- ext[ext$state_fips == "17", ] 
illinois$cd114_name <- paste("Illinois", illinois$cd114_name, sep=" ")
illinois$cd114_code <- paste("IL", illinois$cd114_fips, sep="-" )
ext[134:151, ] <- illinois

indiana  <- ext[ext$state_fips == "18", ] 
indiana$cd114_name <- paste("Indiana", indiana$cd114_name, sep=" ")
indiana$cd114_code <- paste("IN", indiana$cd114_fips, sep="-" )
ext[152:160, ] <- indiana

iowa  <- ext[ext$state_fips == "19", ] 
iowa$cd114_name <- paste("Iowa", iowa$cd114_name, sep=" ")
iowa$cd114_code <- paste("IA", iowa$cd114_fips, sep="-" )
ext[161:164, ] <- iowa

kansas  <- ext[ext$state_fips == "20", ] 
kansas$cd114_name <- paste("Kansas", kansas$cd114_name, sep=" ")
kansas$cd114_code <- paste("KS", kansas$cd114_fips, sep="-" )
ext[165:168, ] <- kansas

kentucky  <- ext[ext$state_fips == "21", ] 
kentucky$cd114_name <- paste("Kentucky", kentucky$cd114_name, sep=" ")
kentucky$cd114_code <- paste("KY", kentucky$cd114_fips, sep="-" )
ext[169:174, ] <- kentucky

louisiana  <- ext[ext$state_fips == "22", ] 
louisiana$cd114_name <- paste("Louisiana", louisiana$cd114_name, sep=" ")
louisiana$cd114_code <- paste("LA", louisiana$cd114_fips, sep="-" )
ext[175:180, ] <- louisiana
  	
maine  <- ext[ext$state_fips == "23", ] 
maine$cd114_name <- paste("Maine", maine$cd114_name, sep=" ")
maine$cd114_code <- paste("ME", maine$cd114_fips, sep="-" )
ext[181:182, ] <- maine

maryland  <- ext[ext$state_fips == "24", ] 
maryland$cd114_name <- paste("Maryland", maryland$cd114_name, sep=" ")
maryland$cd114_code <- paste("MD", maryland$cd114_fips, sep="-" )
ext[183:190, ] <- maryland

massachusetts  <- ext[ext$state_fips == "25", ] 
massachusetts$cd114_name <- paste("Massachusetts", massachusetts$cd114_name, sep=" ")
massachusetts$cd114_code <- paste("MA", massachusetts$cd114_fips, sep="-" )
ext[191:199, ] <- massachusetts

michigan  <- ext[ext$state_fips == "26", ] 
michigan$cd114_name <- paste("Michigan", michigan$cd114_name, sep=" ")
michigan$cd114_code <- paste("MI", michigan$cd114_fips, sep="-" )
ext[200:213, ] <- michigan

minnesota  <- ext[ext$state_fips == "27", ] 
minnesota$cd114_name <- paste("Minnesota", minnesota$cd114_name, sep=" ")
minnesota$cd114_code <- paste("MN", minnesota$cd114_fips, sep="-" )
ext[214:221, ] <- minnesota

mississippi  <- ext[ext$state_fips == "28", ] 
mississippi$cd114_name <- paste("Mississippi", mississippi$cd114_name, sep=" ")
mississippi$cd114_code <- paste("MS", mississippi$cd114_fips, sep="-" )
ext[222:225, ] <- mississippi

missouri  <- ext[ext$state_fips == "29", ] 
missouri$cd114_name <- paste("Missouri", missouri$cd114_name, sep=" ")
missouri$cd114_code <- paste("MO", missouri$cd114_fips, sep="-" )
ext[226:233, ] <- missouri

