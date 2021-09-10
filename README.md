# GeoID aka REF Files

GeoID files, also called Reference files (REF), are the glue between a map and your data.
REF files contain always the GeoID resp. id to reference the area unit on a map, e.g. a county. They also come with additional information like the FIPS code, the County Name, the State Code etc.
You can match your data on any parameter you want and then get rid of anything besides the id.

GeoID's follow the US Geoid2, but extend them internationally and make them unique:     
See espeically GEOID Structure for Geographic Areas at https://www.census.gov/geo/reference/geoidentifiers.html


## Focus on the data
[datamap](https://www.datamap.io) provides you with:
* MAP
* DATA, more precisely with the REF. You then merge your external data EXT with our REF
* VIZ    
This way, when having similarly structured new data, the only thing you have to do, is to merge your external data (EXT) to the REF. 

## GeoID Data as Reference
Finding the current number of counties in the US or in 2010, 2011 etc. is not easy. What is the right number 3142, 3144? All sort of numbers can be found on the Web, but none is dated. Or do you know if Puerto Rico is part of the US? Can they vote at a Presidential Election? 
The REF should make that clear for every year. 

## GeoID Files use International Standards (GENC/ISO 3166-1)
We want to make GeoIDs usable internationally that's why the id always starts with the numeric country code (ISO 3166-1 numeric). After that we use the established codes inside a country. 

## Process
1. The TopoJSON/GeoJSON map only uses GeoIDs to identify an area unit (e.g. id 84006001 for Alameda County, California, USA) 
2. All additional information about a GeoID is in the REF. Next to the GeoID, you will find the area unit names (in different languages if you want) and any codes in use. See an example of a REF here: [us_county_2012](https://github.com/datamapio/geoid/blob/master/US/county/us_county_congressionalvote_2012.csv).
3. Now you can merge your data, the EXT, with the REF. As the REF provides several columns to merge, you should find what is the most appropriate to merge on. (If you see problems arising during your merge, you see it right there in the data and you don't need to go in your map data.) We call the final result of REF and EXT simply the DATA.
4. Continue with the DATA. Keep the GeoID (= id) and all other columns you need for your data visualization. Get rid of all the rest in the DATA as you don't want to load data that will not be used.
5. Rename the DATA. We use the following structure: what_location_areaunit_date. For example: primary_iowa_county_2012.csv
6. Now you can start with your data visualization



## Examples

Here is the REF for US Counties and similar being able to vote at the Presidential Election 2012
https://github.com/datamapio/geoid/blob/master/US/county/us_county_congressionalvote_2012.csv

Here are more examples for Switzerland    
https://github.com/datamapio/geoid/blob/master/CH/README.md

