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

montana  <- ext[ext$state_fips == "30", ] 
montana$cd114_name <- paste("Montana", montana$cd114_name, sep=" ")
montana$cd114_code <- "MT-AL"
ext[234, ] <- montana

nebraska  <- ext[ext$state_fips == "31", ] 
nebraska$cd114_name <- paste("Nebraska", nebraska$cd114_name, sep=" ")
nebraska$cd114_code <- paste("NE", nebraska$cd114_fips, sep="-" )
ext[235:237, ] <- nebraska

nevada  <- ext[ext$state_fips == "32", ] 
nevada$cd114_name <- paste("Nevada", nevada$cd114_name, sep=" ")
nevada$cd114_code <- paste("NV", nevada$cd114_fips, sep="-" )
ext[238:241, ] <- nevada

newhampshire  <- ext[ext$state_fips == "33", ] 
newhampshire$cd114_name <- paste("New Hampshire", newhampshire$cd114_name, sep=" ")
newhampshire$cd114_code <- paste("NH", newhampshire$cd114_fips, sep="-" )
ext[242:243, ] <- newhampshire

newjersey  <- ext[ext$state_fips == "34", ] 
newjersey$cd114_name <- paste("New Jersey", newjersey$cd114_name, sep=" ")
newjersey$cd114_code <- paste("NJ", newjersey$cd114_fips, sep="-" )
ext[244:255, ] <- newjersey

newmexico  <- ext[ext$state_fips == "35", ] 
newmexico$cd114_name <- paste("New Mexico", newmexico$cd114_name, sep=" ")
newmexico$cd114_code <- paste("NM", newmexico$cd114_fips, sep="-" )
ext[256:258, ] <- newmexico

newyork  <- ext[ext$state_fips == "36", ] 
newyork$cd114_name <- paste("New York", newyork$cd114_name, sep=" ")
newyork$cd114_code <- paste("NY", newyork$cd114_fips, sep="-" )
ext[259:285, ] <- newyorkwisconsin

northcarolina  <- ext[ext$state_fips == "37", ] 
northcarolina$cd114_name <- paste("North Carolina", northcarolina$cd114_name, sep=" ")
northcarolina$cd114_code <- paste("NC", northcarolina$cd114_fips, sep="-" )
ext[286:298, ] <- northcarolina

northdakota  <- ext[ext$state_fips == "38", ] 
northdakota$cd114_name <- paste("North Dakota", northdakota$cd114_name, sep=" ")
northdakota$cd114_code <- "ND-AL"
ext[299, ] <- northdakota

ohio  <- ext[ext$state_fips == "39", ] 
ohio$cd114_name <- paste("Ohio", ohio$cd114_name, sep=" ")
ohio$cd114_code <- paste("OH", ohio$cd114_fips, sep="-" )
ext[300:315, ] <- ohio

oklahoma  <- ext[ext$state_fips == "40", ] 
oklahoma$cd114_name <- paste("Oklahoma", oklahoma$cd114_name, sep=" ")
oklahoma$cd114_code <- paste("OK", oklahoma$cd114_fips, sep="-" )
ext[316:320, ] <- oklahoma

oregon  <- ext[ext$state_fips == "41", ] 
oregon$cd114_name <- paste("Oregon", oregon$cd114_name, sep=" ")
oregon$cd114_code <- paste("OR", oregon$cd114_fips, sep="-" )
ext[321:325, ] <- oregon

pennsylvania  <- ext[ext$state_fips == "42", ] 
pennsylvania$cd114_name <- paste("Pennsylvania", pennsylvania$cd114_name, sep=" ")
pennsylvania$cd114_code <- paste("PA", pennsylvania$cd114_fips, sep="-" )
ext[326:343, ] <- pennsylvania

rhodeisland  <- ext[ext$state_fips == "44", ] 
rhodeisland$cd114_name <- paste("Rhode Island", rhodeisland$cd114_name, sep=" ")
rhodeisland$cd114_code <- paste("RI", rhodeisland$cd114_fips, sep="-" )
ext[344:345, ] <- rhodeisland

southcarolina  <- ext[ext$state_fips == "45", ] 
southcarolina$cd114_name <- paste("South Carolina", southcarolina$cd114_name, sep=" ")
southcarolina$cd114_code <- paste("SC", southcarolina$cd114_fips, sep="-" )
ext[346:352, ] <- southcarolina

southdakota <- ext[353, ]
southdakota$id <- "840CD1144600"
southdakota$cd114_name <- "South Dakota Congressional District (at Large)"
southdakota$geoid2 <- 4600
southdakota$state_fips <- 46
southdakota$cd114_fips <- "00"
southdakota$lsad  <- "C1"
southdakota$cdsessn
southdakota$cd114_code <- "SD-AL"
ext[353, ] <- southdakota

tennessee  <- ext[ext$state_fips == "47", ] 
tennessee$cd114_name <- paste("Tennessee", tennessee$cd114_name, sep=" ")
tennessee$cd114_code <- paste("TN", tennessee$cd114_fips, sep="-" )
ext[354:362, ] <- tennessee

texas  <- ext[ext$state_fips == "48", ] 
texas$cd114_name <- paste("Texas", texas$cd114_name, sep=" ")
texas$cd114_code <- paste("TX", texas$cd114_fips, sep="-" )
ext[363:398, ] <- texas 

utah  <- ext[ext$state_fips == "49", ] 
utah$cd114_name <- paste("Utah", utah$cd114_name, sep=" ")
utah$cd114_code <- paste("UT", utah$cd114_fips, sep="-" )
ext[399:402, ] <- utah 

vermont  <- ext[ext$state_fips == "50", ] 
vermont$cd114_name <- paste("Vermont", vermont$cd114_name, sep=" ")
vermont$cd114_code <- " VT-AL"
ext[403, ] <- vermont

virginia  <- ext[ext$state_fips == "51", ] 
virginia$cd114_name <- paste("Virginia", virginia$cd114_name, sep=" ")
virginia$cd114_code <- paste("VA", virginia$cd114_fips, sep="-" )
ext[404:414, ] <- virginia

washington  <- ext[ext$state_fips == "53", ] 
washington$cd114_name <- paste("Washington", washington$cd114_name, sep=" ")
washington$cd114_code <- paste("WA", washington$cd114_fips, sep="-" )
ext[415:424, ] <- washington

westvirginia  <- ext[ext$state_fips == "54", ] 
westvirginia$cd114_name <- paste("West Virginia", westvirginia$cd114_name, sep=" ")
westvirginia$cd114_code <- paste("WV", westvirginia$cd114_fips, sep="-" )
ext[425:427, ] <- westvirginia

wisconsin  <- ext[ext$state_fips == "55", ] 
wisconsin$cd114_name <- paste("Wisconsin", wisconsin$cd114_name, sep=" ")
wisconsin$cd114_code <- paste("WI", wisconsin$cd114_fips, sep="-" )
ext[428:435, ] <- wisconsin

wyoming  <- ext[ext$state_fips == "56", ] 
wyoming$cd114_name <- paste("Wyoming", wyoming$cd114_name, sep=" ")
wyoming$cd114_code <- "WY-AL"
ext[436, ] <- wyoming

## Not Voting 
americansamoa  <- ext[ext$state_fips == "60", ] 
americansamoa$cd114_name <- paste("American Samoa", americansamoa$cd114_name, sep=" ")
americansamoa$cd114_code <- "Non Voting Member"
ext[437, ] <- americansamoa

guam <- ext[ext$state_fips == "66", ] 
guam$cd114_name <- paste("Guam", guam$cd114_name, sep=" ")
guam$cd114_code <- "Non Voting Member"
ext[438, ] <- guam

nmi <- ext[ext$state_fips == "69", ] 
nmi$cd114_name <- paste("Northern Mariana Islands", nmi$cd114_name, sep=" ")
nmi$cd114_code <- "Non Voting Member"
ext[439, ] <- nmi

pr <- ext[ext$state_fips == "72", ] 
pr$cd114_name <- paste("Puerto Rico", pr$cd114_name, sep=" ")
pr$cd114_code <- "Non Voting Member"
ext[440, ] <- pr

vi <- ext[ext$state_fips == "78", ] 
vi$cd114_name <- paste("U.S. Virgin Islands", vi$cd114_name, sep=" ")
vi$cd114_code <- "Non Voting Member"
ext[441, ] <- vi

ext1 <- select(ext, id,  cd114_code, cd114_name,	geoid2,	state_fips,	cd114_fips,	lsad,	cdsessn)
write.table(ext1, "cd114_with_non_voting_members.csv", sep="," , col.names=TRUE, row.names=FALSE)

ext2 <-ext1[!(ext1$cd114_code =="Non Voting Member"),]
write.table(ext2, "cd114.csv", sep="," , col.names=TRUE, row.names=FALSE)

