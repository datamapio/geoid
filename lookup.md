
#GEOID LOOKUP
## Some Guidelines
- Use numeric as much as possible (not always possible)
- Use delimiters between the numeric country code and what follows only if there is a possible clash
- Use short delimiters
- Use delimiters consistenly

Delimiter in use: 
- ZP: for ZIP or Postal Code. Only use when necessary.



##Country
Country (3, numeric, ISO)   
Type: Numeric     
840    
Ex. 840 = US   

##CA
Canada      
124     

###Postal Code (Canadapost) 
Type: Alphanumeric, 9   
Country (3, numeric, ISO) | Postal Code (6, alphanumeric, Canadapost)    
124 | K1AOB1     
Ex.  124K1AOB1 = Postal Code K1A OB1    
Note: There is no space between 3rd and 4th character for the GeoID (= id).      

See: 
http://www.statcan.gc.ca/eng/mgeo/geo   
http://www.statcan.gc.ca/pub/92-195-x/2011001/other-autre/hierarch/p1-eng.htm


##US
United States of America    
840    

###State  
Type: Numeric, 5      
Country (3, numeric, ISO) | State (2, numeric, FIPS)   
840 | 06      
Ex. 84006 = California   

###County
Type: Numeric, 8    
Country(3, numeric, ISO) | State (2, numeric, FIPS) | County (3, numeric, FIPS)   
840 | 06 | 001     
Ex. 84006001 = Alameda County   

###ZIP Code (ZIP Code Tabulation Area (ZCTA)) 
Type: Alphanumeric, 10    
Country (3, numeric, ISO) | ZP (2, alphabetic) | ZIP Code (5, numeric, USPS)   
840 | ZP | 94702    
Ex. 840ZP94702 = ZIP Code 94702   




Standards:   

GENC: https://nsgreg.nga.mil/genc/discovery
ISO 3611-1: https://en.wikipedia.org/wiki/ISO_3166-1
FIPS: http://quickfacts.census.gov/qfd/meta/long_fips.htm
The World Factbook: https://www.cia.gov/library/publications/the-world-factbook/appendix/appendix-d.html