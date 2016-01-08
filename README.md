# GeoID Files

GeoID files are the glue between a map and your data.
GeoID data files contain always the id to reference the area unit on a map, e.g. a county. They also come with additional information like the FIPS code, the County Name, the State Code etc.
You can match your data on any parameter you want and then get rid of anything besides the id.


## Focus on the data
datamap provides you with:
* MAP (a TopoJSON or GeoJSON file)
* GEOID DATA (currently as csv. file)
* DATAVIZ (the index.html)
This way, when having similarly structured, but new data, the only thing you have to do, is to add your data to the CSV. 

## GeoID Data as Reference
Finding the current number of counties in the US or in 2010, 2011 etc. is not easy. What is the right number 3142, 3144? Is Puerto Rico part of this etc. etc.
The reference files should make that clear. 

## GeoID Files use International Standards (GENC/ISO 3166-1)
We want to make GeoIDs usable internationally that's why the id always starts with the numeric country code (ISO 3166-1 numeric). After that we use the established codes inside a country. 


## Examples

Here is a reference GeoID file for US States and other areas like Puerto Rico
https://github.com/datamapio/geoid/blob/master/US/state/us_state_and_other.csv

Here is a reference GeoID file for US Counties and similar being able to vote at the Presidential Election 2012
https://github.com/datamapio/geoid/blob/master/US/county/us_county_congressionalvote_2012.csv
