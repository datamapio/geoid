# GeoID Files (REF)

GeoID files, also called Reference files (REF), are the glue between a map and your data.
REF files contain always the GeoID resp. id to reference the area unit on a map, e.g. a county. They also come with additional information like the FIPS code, the County Name, the State Code etc.
You can match your data on any parameter you want and then get rid of anything besides the id.


## Focus on the data
datamap provides you with:
* MAP (a TopoJSON or GeoJSON file)
* DATE or the REF (currently as csv. file)
* DATAVIZ (the index.html)
This way, when having similarly structured new data, the only thing you have to do, is to merge your external data (EXT) to the REF. 

## GeoID Data as Reference
Finding the current number of counties in the US or in 2010, 2011 etc. is not easy. What is the right number 3142, 3144? All sort of numbers can be found on the Web, but none is dated. Or do you know if Puerto Rico is part of the US? Can they vote at a Presidential Election? 
The REF should make that clear for every year. 

## GeoID Files use International Standards (GENC/ISO 3166-1)
We want to make GeoIDs usable internationally that's why the id always starts with the numeric country code (ISO 3166-1 numeric). After that we use the established codes inside a country. 

## Process
1. Map in TopoJSON/GeoJSON only uses GeoID to identify an area unit (e.g. 84006001 for Alameda County, California, USA) 
2. GeoIDs are tied to all additional information in the REF, which are the area unit names (in different languages if you want), any codes in use etc.
3. Merge: Now you can merge your data, the EXT, with the REF. As the REF provides several columns to merge, you should find what is the most appropriate to merge on. If you see problems arise during your merge, you see it in the data. We call the result simply the MERGE
4. MERGE: Keep the GeoID (= id) and all other columns you need for your data visualization. Get rid of all the rest in the MERGE as you don't want to load data that is not necessary.
5. Rename the MERGE. We use the following structure: what_location_areaunit_date. For example: primary_iowa_county_2012.csv
6. Now you can start with your data visualization



## Examples

Here is a reference GeoID file for US States and other areas like Puerto Rico
https://github.com/datamapio/geoid/blob/master/US/state/us_state_and_other.csv

Here is a reference GeoID file for US Counties and similar being able to vote at the Presidential Election 2012
https://github.com/datamapio/geoid/blob/master/US/county/us_county_congressionalvote_2012.csv
