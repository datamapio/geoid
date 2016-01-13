# Special Cases: Election

## US Presidential Elections 2012

EXT has data by self, parent and children 
Here:   
self = county    
parent = state   
children = precinct   

Otherwise said in the EXT there is not only county data, but the county data is mixed up with state and precinct data.


### EXT DATA
During election night, the data comes in in all sorts of ways. Ideally you get the data per county, but as we can see in this [file](http://image.guardian.co.uk/sys-files/Guardian/documents/2012/11/14/US_elect_county.xls) from November 14, 2012, this is not always the case.

Our [REF](https://github.com/datamapio/geoid/blob/master/US/county/us_county_congressionalvote_2012.csv) has 3143 rows/observations whereas the EXT has 4074 rows/observations.

So let's start by comparing the number of counties per state:
[REF](https://github.com/datamapio/geoid/blob/master/US/county/us_county_by_state_2010-2012.csv)
[EXT](https://github.com/datamapio/geoid/blob/master/special_cases/us_county_by_state_ext.csv)
