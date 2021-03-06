## setwd("/Users/rogerfischer/datamap/geoid/US/city")
## getwd()

## This is a work of progress. There is too much repetition for sure and not enough functionss :)

## Download from: https://github.com/datamapio/geoid/blob/master/US/city/PEP_2014_PEPANNRSIP.US12A_with_ann.csv
ext <- read.csv ("PEP_2014_PEPANNRSIP.US12A_with_ann.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE)

## Select 
## GC_RANK.target.geo.id2
## GC_RANK.display.label.1
## rescensus42010
## respop72014

## id | geoid2 | place_fips | place_name | capital (= 1) | state_name | state_code | state_fips | lat | lon | pop_census_2010 | pop_est_2014
## Ex. Manchester
## 8403345140 | 3345140 | 45140 | Manchester | NA | New Hampshire | NH | 33 | 42.99564 | -71.454789 | 109565 | 109565

## Missing: capital, state_code (?), lat, lon

library(dplyr)
ext_sub <- select(ext, GC_RANK.target.geo.id2, GC_RANK.display.label.1, rescensus42010, respop72014)
names(ext_sub) <- c("geoid2", "place_name_state", "pop_census_2010", "pop_est_2014")

## http://garrettgman.github.io/tidying/
library(tidyr)
## Split place_name_state into place_name and state_name
ext_sub <- separate(ext_sub, place_name_state, into = c("place_name", "state_name"), , sep = ",")

## Split geoid2 into state_code and placefp
ext_sub$state_fips <- substr(ext_sub$geoid2, 1, nchar(ext_sub$geoid2)-5)

# Use last 5 characters to create place_fips
## Function, not used
substrRight <- function(x, n){
  substr(x, nchar(x)-n+1, nchar(x))
}
## Still a mistery why it is -4, not -5 ((nchar(x)-n+1))
ext_sub$place_fips <- substr(ext_sub$geoid2, nchar(ext_sub$geoid2)-4, nchar(ext_sub$geoid2))


## Trim leading and trailing spaces
trim_state <- function (x) gsub("^\\s+|\\s+$", "", x)
ext_sub$state_name <- trim_state(ext_sub$state_name)

## Trim city from place name (somewhat dangerous!!!)
trim_place <- function (x) gsub("\\s+city$", "", x)
ext_sub$place_name <- trim_place(ext_sub$place_name)
trim_place2 <- function (x) gsub("\\s+town$", "", x)
ext_sub$place_name <- trim_place2(ext_sub$place_name)

## For each state, take the first 5 largest cities in 2014

cities5 <- function(x, name) {
  y <- slice(filter(x, state_name == name), 1:5)  
}  

states <- c("Colorado", "California", "Georgia") 

## this must be the same type of dataframe than s, otherwise it will not work.
cities = data.frame()

uscities <- function(d) {  
  for (i in d) {
    s <- cities5(ext_sub, i)
    ##cities <- rbind(cities,s)
 
    ## us_cities <- rbind_all(list(alabama, arizona, iowa, nevada, new_hampshire, south_carolina))    
    ##us_cities$id <- paste("840", us_cities$geoid2, sep="")
    ##us_cities <- us_cities[c("id", "geoid2", "place_fips", "place_name", "state_name", "state_fips",  "pop_census_2010", "pop_est_2014")]    
  } 
}

uscities(states)


## 84001  01	AL	Alabama 
alabama <- cities5(ext_sub, "Alabama")
## 84002  02	AK	Alaska
## 84004	04	AZ	Arizona
arizona <- cities5(ext_sub, "Arizona")
## 84005	05	AR	Arkansas
## 84006	06	CA	California
## 84008	08	CO	Colorado	
## 84009	09	CT	Connecticut	01779780
## 84010	10	DE	Delaware	01779781
## 84011	11	DC	District of Columbia	01702382
## 84012	12	FL	Florida	00294478
## 84013	13	GA	Georgia	01705317
## 84015	15	HI	Hawaii	01779782
## 84016	16	ID	Idaho	01779783
## 84017	17	IL	Illinois	01779784
## 84018	18	IN	Indiana	00448508

## 84019  19  IA	Iowa
iowa <- cities5(ext_sub, "Iowa")

## 84020	20	KS	Kansas	00481813
## 84021	21	KY	Kentucky	01779786
## 84022	22	LA	Louisiana	01629543
## 84023	23	ME	Maine	01779787
## 84024	24	MD	Maryland	01714934
## 84025	25	MA	Massachusetts	00606926
## 84026	26	MI	Michigan	01779789
## 84027	27	MN	Minnesota	00662849
## 84028	28	MS	Mississippi	01779790
## 84029	29	MO	Missouri	01779791
## 84030	30	MT	Montana	00767982
## 84031	31	NE	Nebraska	01779792

## 84032	32	NV	Nevada
nevada <- cities5(ext_sub, "Nevada")

## 84033	33	NH	New Hampshire
## Only 2 have over 50K; Next 3 are: Concord, Derry, Rochester
new_hampshire <- cities5(ext_sub, "New Hampshire")


## 84034	34	NJ	New Jersey	01779795
## 84035	35	NM	New Mexico	00897535
## 84036	36	NY	New York	01779796
## 84037	37	NC	North Carolina	01027616
## 84038	38	ND	North Dakota	01779797
## 84039	39	OH	Ohio	01085497
## 84040	40	OK	Oklahoma	01102857
## 84041	41	OR	Oregon	01155107
## 84042	42	PA	Pennsylvania	01779798
## 84044	44	RI	Rhode Island	01219835

## 84045	45	SC	South Carolina	01779799
south_carolina <- cities5(ext_sub, "South Carolina")


## 84046	46	SD	South Dakota	01785534
## 84047	47	TN	Tennessee	01325873
## 84048	48	TX	Texas	01779801
## 84049	49	UT	Utah	01455989
## 84050	50	VT	Vermont	01779802
## 84051	51	VA	Virginia	01779803
## 84053	53	WA	Washington	01779804
## 84054	54	WV	West Virginia	01779805
## 84055	55	WI	Wisconsin	01779806
## 84056	56	WY	Wyoming

## To Do: Geocoding
## http://stackoverflow.com/questions/20937682/r-trying-to-find-latitude-longitude-data-for-cities-in-europe-and-getting-geocod
## http://www.r-bloggers.com/batch-geocoding-with-r-and-google-maps/

us_cities <- rbind_all(list(alabama, arizona, iowa, nevada, new_hampshire, south_carolina))
us_cities$id <- paste("840", us_cities$geoid2, sep="")
us_cities <- us_cities[c("id", "geoid2", "place_fips", "place_name", "state_name", "state_fips",  "pop_census_2010", "pop_est_2014")]

# Simple Geocoding
library(ggmap)
addresses = us_cities$place_name
addresses = paste0(addresses, ",",us_cities$state_name)
geocodes <- geocode(as.character(addresses))
us_cities_geocodes <- data.frame(us_cities,geocodes)

#Map file 
us_city_2010_2016_map <-us_cities_geocodes[c("id","lon","lat")]
colnames(us_city_2010_2016_map)[2]<-"long"
us_city_2010_2016_map <-us_city_2010_2016_map[c(1,3,2)]
write.table(us_city_2010_2016_map, file="us_city_2010_2016_map.csv", sep="," , col.names=TRUE, row.names=FALSE)

#Data file
us_city_2010_2016_data <-us_cities_geocodes[c("id","geoid2","place_fips","place_name","state_name","state_fips","pop_census_2010","pop_est_2014" )]
write.table(us_city_2010_2016_data, file="us_city_2010_2016_data.csv", sep="," , col.names=TRUE, row.names=FALSE)
