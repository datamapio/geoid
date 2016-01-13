# Special Cases: Election

## US Presidential Elections 2012

PROBLEM: How to visualize messy data which covers bigger and smaller units than your base unit? What are the best strategies?   

EXT has data by self, parent and children 
Here:   
self = county    
parent = state   
children = precinct   

Otherwise said in the EXT there is not only county data, but the county data is mixed up with state and precinct data.


### EXT
During election night, the data comes in in all sorts of ways. Ideally you get the data per county, but as we can see in this [file](http://image.guardian.co.uk/sys-files/Guardian/documents/2012/11/14/US_elect_county.xls) from November 14, 2012, this is not always the case.

We first use Excel Sheet 1 (OBAMA V ROMNEY ONLY)

Our [REF](https://github.com/datamapio/geoid/blob/master/US/county/us_county_congressionalvote_2012.csv) has 3143 rows/observations whereas the EXT has 4074 rows/observations.

So let's start by comparing the number of counties per state:   
[REF](https://github.com/datamapio/geoid/blob/master/US/county/us_county_by_state_2010-2012.csv) versus 
[EXT](https://github.com/datamapio/geoid/blob/master/special_cases/us_county_by_state_ext.csv)

And here is an overview side by side
[Comparison REF and EXT](https://github.com/datamapio/geoid/blob/master/special_cases/ref_ext_comparison_us_county_by_state.csv)

What becomes immediately clear is that the EXT covers only 44 states, whereas the REF covers all 51 (50 States plus DC). All the NA's are standing in for missing data.

So we need to find better data or else our data viz is incomplete.


### EXT 2
Let's look now at the Excel Sheet 2 (Full Data)
It has 4639 rows/observations instead of only 4074 rows/observations 

The result is much better: [REF EXT2 comparison: Number of Counties per State](https://github.com/datamapio/geoid/blob/master/special_cases/ref_ext2_comparison_us_county_by_state.csv) 

If the difference is one between the number of counties, it is normally because in the EXT2 we not only have the county data by itself, but also the state totals. If it is much more than the number of counties, we will probably have precinct data. If it is less, then we have either unreported counties or only state data (like in the case of Alaska).

Here are the ones to check in detail:

id		| state_code | county_number_ref	| county_number_ext |  
--------|:----------:|:--------------------:|:-----------------:|
84002	| AK		 | 29					| 2   				|
84009	| CT  		 | 8  					| 170 				|   
84015	| HI  		 | 5    				| 5  				|    
84023	| ME   		 | 16           		| 500  				|    
84025	| MA		 | 14					| 352    		    | 
84033	| NH 		 | 10					| 238 				|    
84044	| RI  		 | 5					| 40 				|  	  
84050	| VT		 | 14					| 247 				|    

 
