## setwd("/Users/rogerfischer/datamap/geoid/US/city")
## getwd()

## Download from: https://github.com/datamapio/geoid/blob/master/US/city/PEP_2014_PEPANNRSIP.US12A_with_ann.csv
ext <- read.csv ("PEP_2014_PEPANNRSIP.US12A_with_ann.csv", header = TRUE, sep = ",", stringsAsFactors=FALSE)

## Select 
## GC_RANK.target.geo.id2
## GC_RANK.display.label.1
## rescensus42010
## respop72014

## id | geoid2 | placefp | place_name | capital (= 1) | state_name | state_code | state_fips | lat | lon | pop_census_2010 | pop_est_2014
## Ex. Manchester
## 8403345140 | 3345140 | 45140 | Manchester | NA | New Hampshire | NH | 33 | 42.99564 | -71.454789 | 109565 | 109565


library(dplyr)
ext_sub <- select(ext, GC_RANK.target.geo.id2, GC_RANK.display.label.1, rescensus42010, respop72014)
names(ext_sub) <- c("geoid2", "place_name_state", "pop_census_2010", "pop_est_2014")

## http://garrettgman.github.io/tidying/
library(tidyr)
## Split place_name_state into place_name and state_name
ext_sub <- separate(ext_sub, place_name_state, into = c("place_name", "state_name"), , sep = ",")

## Split geoid2 into state_code and placefp
ext_sub$geoid2copy <- ext_sub$geoid2
ext_sub$state_code <- substr(ext_sub$geoid2, 1, nchar(ext_sub$geoid2)-5)

## Trim leading and trailing spaces
trim_state <- function (x) gsub("^\\s+|\\s+$", "", x)
ext_sub$state_name <- trim_state(ext_sub$state_name)

## Trim city from place name (somewhat dangerous!!!)
trim_place <- function (x) gsub("\\s+city$", "", x)
ext_sub$place_name <- trim_place(ext_sub$place_name)
trim_place2 <- function (x) gsub("\\s+town$", "", x)
ext_sub$place_name <- trim_place2(ext_sub$place_name)

## For each state, take the first 5 largest cities in 2014

## 84001  01	AL	Alabama 
alabama <- filter(ext_sub, state_name == "Alabama")
alabama5 <- slice(alabama, 1:5)

## 84002  02	AK	Alaska
## 84004	04	AZ	Arizona
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
iowa <- filter(ext_sub, grepl("Iowa", state_name))
iowa5 <- slice(iowa, 1:5)

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
nevada <- filter(ext_sub, state_name == "Nevada")
nevada5 <- slice(nevada, 1:5)

## 84033	33	NH	New Hampshire
## Only 2 have over 50K; Next 3 are: Concord, Derry, Rochester
new_hampshire <- filter(ext_sub, state_name == "New Hampshire")
new_hampshire5 <- slice(new_hampshire, 1:5)

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
south_carolina <- filter(ext_sub, state_name == "South Carolina")
south_carolina5 <- slice(south_carolina, 1:5)

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

primary4 <- rbind_all(list(iowa5, nevada5, new_hampshire5, south_carolina5))
primary4$id <- paste("840", primary4$geoid2, sep="")
primary4 <- primary4[c("id", "geoid2", "place_name", "state_name", "state_code",  "pop_census_2010", "pop_est_2014")]

write.table(primary4, file="primaryfirst4_city_2010_2014.csv", sep="," , col.names=TRUE, row.names=FALSE)
