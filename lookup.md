
#GEOID LOOKUP
## Some Guidelines
- Use numeric as much as possible (not always possible)
- Use parent-children relationships when possible (country > state > county; country > canton > district > municipality).
- Use delimiters between the numeric country code and what follows only if there is a possible clash
- Use short delimiters
- Use delimiters consistenly

Delimiters in use: 
- No delimiter (country > state > county; country > canton > district > municipality etc)
- ZP: for Z like ZIP and P like Postal Code. Only use when necessary.
- PCT: Precinct


##Country List
- [CA](https://github.com/datamapio/geoid/blob/master/lookup.md#ca)
- [CH](https://github.com/datamapio/geoid/blob/master/lookup.md#ch)
- [US](https://github.com/datamapio/geoid/blob/master/lookup.md#us)



##Country
Country (3, numeric, ISO)   
Type: Numeric     
840    
Ex. 840 = US   

##CA
Canada      
124     

###Postal Code (Canadapost) 
Type: Alphanumeric, 11   
Country (3, numeric, ISO) | ZP (2, alphabetic) | Postal Code (6, alphanumeric, Canadapost)    
124 | ZP | K1AOB1     
Ex.  124ZPK1AOB1 = Postal Code K1A OB1    
Note: There is no space between 3rd and 4th character for the GeoID (= id).      

See: 
http://www.statcan.gc.ca/eng/mgeo/geo   
http://www.statcan.gc.ca/pub/92-195-x/2011001/other-autre/hierarch/p1-eng.htm


##CH
Switzerland
756

###Canton
Type: Numeric, 4   
Country (3, numeric, ISO) | State (2, numeric, BFS)    
756 | 01   
Ex. 75601 = Canton of Zurich   
We add the leading zeros for cantons that have only one digit   

###District (Bezirk)
Type: Numeric, 6   
Country (3, numeric, ISO) | State (2, numeric, BFS) | District (2, numeric, BFS)   
756 | 01 | 12   
Ex. 7560112 = District Zurich 
We add the leading zeros for district that have only one digit    

###Municipality (Commune / Gemeinde)
Type: Numeric, 11   
Country (3, numeric, ISO) | State (2, numeric, BFS) | District (2, numeric, BFS) | Municipality (4, numeric, BFS)   
756 | 01 | 12 | 0261
Ex. 75601120261 = Municipality of Zurich  
We add the leading zeros for municipalities with less then 4 digits    

###Postal Code (PLZ)
Type: Alphanumeric, 9     
Country (3, numeric, ISO) | ZP (2, alphabetic) | PLZ (4, numeric, Swiss Post)     
756 | ZP | 8004      
Ex. 756ZP8004 = PLZ 8004 = Kreis 4, City of Zurich   

Reference:   
http://www.bfs.admin.ch/bfs/portal/de/index/infothek/nomenklaturen/blank/blank/gem_liste/03.html   


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

###Place
Type: Numeric, 10    
Country(3, numeric, ISO) | State (2, numeric, FIPS) | Place (5, numeric, Census)   
840 | 33 | 45140     
Ex. 8403345140 = Manchester, New Hampshire  

###ZIP Code / ZIP Code Tabulation Area (ZCTA)
Type: Alphanumeric, 10    
Country (3, numeric, ISO) | ZP (2, alphabetic) | ZIP Code (5, numeric, USPS)   
840 | ZP | 94702    
Ex. 840ZP94702 = ZIP Code 94702 

###Precinct Code
Type: Alphanumeric, 15    
Country(3, numeric, ISO) | State (2, numeric, FIPS) | County (3, numeric, FIPS) | PCT (3, alphabetic) | Precinct Number (4, numeric)   
840 | 06 | 075 | PCT | 1117   
Ex. 84006075PCT1117 = Precinct 1117 in San Francisco   





Standards:   

GENC: https://nsgreg.nga.mil/genc/discovery
ISO 3611-1: https://en.wikipedia.org/wiki/ISO_3166-1
FIPS: http://quickfacts.census.gov/qfd/meta/long_fips.htm
The World Factbook: https://www.cia.gov/library/publications/the-world-factbook/appendix/appendix-d.html