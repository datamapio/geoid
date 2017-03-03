
#GEOID LOOKUP
## Some Guidelines
- Use numeric as much as possible (it is not always possible nevertheless)
- Use parent-children relationships when possible (country > state > county; country > canton > district > municipality).
- Use delimiters between the numeric country code and what follows only if there is a possible clash
- Use short delimiters
- Use delimiters consistenly

Delimiters in use: 
- No delimiters if possible (country > state > county; country > canton > district > municipality etc)
  Exceptions: Belgium    
- AD: State Assembly District
- CD, CD114: (US) Congressional District; (GB) Constituency Division (= Westminster Constituency)  
- CT: Census Tract (see US)
- P: Place (see US)
- PCT: Precinct
- SD: State Senate District
- ZP: for Z like ZIP and P like Postal Code.




##Country List
- [BE, Belgium](https://github.com/datamapio/geoid/blob/master/lookup.md#be)	
- [CA, Canada](https://github.com/datamapio/geoid/blob/master/lookup.md#ca)
- [CH, Switzerland](https://github.com/datamapio/geoid/blob/master/lookup.md#ch)
- [DE, Germany](https://github.com/datamapio/geoid/blob/master/lookup.md#de)
- [DK, Denmark](https://github.com/datamapio/geoid/blob/master/lookup.md#dk) 
- [ET, Ethiopia](https://github.com/datamapio/geoid/blob/master/lookup.md#et)
- [GB, United Kingdom of Great Britain and Northern Ireland](https://github.com/datamapio/geoid/blob/master/lookup.md#gb)
- [IN, India](https://github.com/datamapio/geoid/blob/master/lookup.md#in)
- [KE, Kenya](https://github.com/datamapio/geoid/blob/master/lookup.md#ke)
- [TW, Republic of China(ROC)/Taiwan](https://github.com/datamapio/geoid/blob/master/lookup.md#tw)
- [US, United States of America](https://github.com/datamapio/geoid/blob/master/lookup.md#us)
- [ZA, South Africa](https://github.com/datamapio/geoid/blob/master/lookup.md#za)


##Country
Country (3, numeric, ISO)   
Type: Numeric     
840    
Ex. 840 = US   

##BE  
Belgium     
056   

###Regions
Type: Alphanumeric, 4          
Country (3, numeric, ISO) | Region Code (1, alphabetic)     
056 | W   

Examples:     
056W = Wallonne Region    
056F = Flamand Region    
056B = Bruxelles Capital Region    
NOTE: Does not conform to codes used in Belgium (2000, 3000, 4000)


###Provinces
Type: Alphanumeric, 5     
Country (3, numeric, ISO) | Region Code (1, alphabetic) | Province Code (1, numeric)     
056 | W | 2      
Ex. 056W2 = Brabant wallon    
Ex. 056F2 = Vlaams-Brabant   
Ex. 056F4 = Flandres Orientale    
Note: We use the alphabet to keep the link to the province numbers.   


###Arrondissements
Type: Numeric, 6           
Country (3, numeric, ISO) | Region Code (1, alphabetic) | Arrondissement Code (2, numeric, INS)      
056 | F | 23   
Ex. 056F23 = Arrondissement de Hal-Vilvorde, Braband Flamand   
Note: We drop the 3 trailing zeros   


###Municipalities (Gemeenten, Communes, Gemeinden)
Type: Numeric, 9    
Country (3, numeric, ISO) | Region Code (1, alphabetic) | Municipality Code (5, numeric, INS)     
056 | B | 21015      
Ex. 056B21015 = SCHAERBEEK, Région Bruxelles-Capitale (21015)       
Ex. 056F23027 = Hal, Hal-Vilvorde, Brabant Flamand (23027)      


###Municipality Parts/Sections, City Districts (Deelgemeenten, Districts (Antwerpen), Ancienne commune, Section de commune)
Type: Alphanumeric, 10      
Country (3, numeric, ISO) | Region Code (1, alphabetic) | Municipality Code (5, numeric, INS) | M. Part (1, alphabetic)    
056 | F | 71053 | B      
Ex. 056F71053B = Halmaal, Sint-Truiden (Saint-Trond), Hasselt, Limbourg     


###Statistical Sectors (Statistische Sector)
Type: Alphanumeric, 13     
Country (3, numeric, ISO) | Region Code (1, alphabetic) | Municipality Code (5, numeric, INS) | M. Part (1, alphabetic) | Stat. Sector (3, alphanumeric)        
056 | F | 71053 | B | 180     
Ex. 056F71053B180 = Overhalmaal, Sint-Truiden (Saint-Trond), Hasselt, Limbourg      
See: [Sint-Truiden](http://limburg.be/webfiles/limburg/loketdienst/cijfers/cijferkorf_demografie/gemeenten/11b_c_sinttruiden.pdf)    
See also pages [13 and 62 in Statistic Sectors](http://statbel.fgov.be/en/binaries/Secteur%20stat-FR_tcm327-174181.pdf):
```
Example : 52011B1NR
Example : 52011B170
52011                     B (A à Z, 0 à 9)     1 (0,9)       N (0 à 9,A à V) R(-,0 à 9, lettre)
Code INS commune          ancienne commune     section       utilisation du sol modification par
                          ou assimilé                        rapport à la situation antérieure 
```     


###Postal Code   
Type: Alphanumeric, 9         
Country (3, numeric, ISO) | ZP (2, alphabetic) | Postal Code (4, numeric)       
056 | ZP | 1030       
Ex. 056ZP1030 = Postal Code 1030 for Schaerbeek/Schaarbeek, Bruxelles    

Reference:    
http://statbel.fgov.be/fr/modules/publications/statistiques/enquetes_et_methodologie/downloads/code_ins.jsp     
http://www.notrebelgique.be/fr/index.php?nv=37    
Municipalities for Flanders:    
http://www.geopunt.be/download?container=referentiebestand-gemeenten&title=Voorlopig%20referentiebestand%20gemeentegrenzen


##CA
Canada      
124     

###Postal Code (Canadapost) 
Type: Alphanumeric, 11   
Country (3, numeric, ISO) | ZP (2, alphabetic) | Postal Code (6, alphanumeric, Canadapost)    
124 | ZP | K1AOB1     
Ex.  124ZPK1AOB1 = Postal Code K1A OB1    
Note: There is no space between 3rd and 4th character for the GeoID (= id).      

Reference:     
http://www.statcan.gc.ca/eng/mgeo/geo     
http://www.statcan.gc.ca/pub/92-195-x/2011001/other-autre/hierarch/p1-eng.htm    


##CH
Switzerland
756

###Canton
Type: Numeric, 5   
Country (3, numeric, ISO) | State (2, numeric, BFS)    
756 | 01      
Ex. 75601 = Canton of Zurich      
We add the leading zeros for cantons that have only one digit     

###District (Bezirk)
Type: Numeric, 7   
Country (3, numeric, ISO) | State (2, numeric, BFS) | District (2, numeric, BFS)   
756 | 01 | 12      
Ex. 7560112 = District of Zurich     
We add the leading zeros for districts that have only one digit      

###Municipality (Commune / Gemeinde)
Type: Numeric, 11   
Country (3, numeric, ISO) | State (2, numeric, BFS) | District (2, numeric, BFS) | Municipality (4, numeric, BFS)   
756 | 01 | 12 | 0261     
Ex. 75601120261 = Municipality of Zurich       
We add the leading zeros for municipalities with less then 4 digits      

###City Districts (Kreise)
Type: Numeric, 13     
Country (3, numeric, ISO) | State (2, numeric, BFS) | District (2, numeric, BFS) | Municipality (4, numeric, BFS) | City District (2, numeric, BFS)      
756 | 01 | 12 | 0261 | 01    
Ex. 7560112026101 = Kreis 1 (City District 1), City/Municipality of Zurich    
Note: Zurich has 12 City Districts   

###Neighborhoods (Quartiere)
Type: Numeric, 14          
Country (3, numeric, ISO) | State (2, numeric, BFS) | District (2, numeric, BFS) | Municipality (4, numeric, BFS) | Neighborhood (3, numeric, BFS)       
756 | 01 | 12 | 0261 | 014   
Ex. 75601120261014 = Neighborhood "City", City District 1, Municipality of Zurich           
Ex. 75601120261052 = Neighborhood "Escher Wyss", District 5, Municipality of Zurich             
Note: Zurich has 34 Statistical Quartiere (https://de.wikipedia.org/wiki/Stadtteile_der_Stadt_Z%C3%BCrich)    

###Statistical Zones (Statistische Zonen (SZ))
Type: Numeric, 16     
Country (3, numeric, ISO) | State (2, numeric, BFS) | District (2, numeric, BFS) | Municipality (4, numeric, BFS) | Neighborhood (3, numeric, BFS) | SZ (2, numeric, City of Zurich)       
756 | 01 | 12 | 0261 | 014 | 04         
Ex. 7560112026101404 = Statistical Zone "Paradeplatz", Neighborhood "City", City District 1, Municipality of Zurich     
Ex. 7560112026105202 = Statistical Zone "Technopark", Neighborhood "Escher Wyss", District 5, Municipality of Zurich     

Note: Zurich https://data.stadt-zuerich.ch/storage/f/stat_zonen/statistische_zonen.json      

Reference:        
http://www.bfs.admin.ch/bfs/portal/de/index/infothek/nomenklaturen/blank/blank/gem_liste/03.html     

###Postal Code (PLZ)
Type: Alphanumeric, 9     
Country (3, numeric, ISO) | ZP (2, alphabetic) | PLZ (4, numeric, Swiss Post)     
756 | ZP | 8004      
Ex. 756ZP8004 = PLZ 8004 = Kreis 4, City of Zurich   


##DE
Germany    
276 

###States (16 Länder)
Type: Numeric, 5  
Country (3, numeric, ISO) | State (2, numeric)    
276 | 11      
Ex. 27611 = Berlin          
Ex. 27602 = Hamburg                 
We add the leading zeros for cantons that have only one digit       

###Municipality (Gemeinde)
Type: Numeric, 11   
Country (3, numeric, ISO) | Municipality (8, numeric)    
276 | 04012000         
Ex. 27604012000 = Bremerhaven       


##DK
Denmark    
208    


##ET
Ethiopia    
231    
http://africaopendata.org/dataset/ethiopia-shapefiles   

##GB
United Kingdom of Great Britain and Northern Ireland
826 

###3 Countries and a Province
Type: Alphanumeric, 4     
Kingdom (3, numeric) | Country or Province (1, alphabetic)   
826 | E    
Ex. 826E = England; 826W = Wales; 826S = Scotland; 826N = Northern Ireland    
   
Note: Does not conform to:     
England E92000001;  Wales W92000004 ; Scotland S92000003 ; Northern Ireland N92000002     


###England: Regions
Type: Alphanumeric, 5           
Kingdom (3, numeric) | Country or Province (1, alphabetic) | Region (1, numeric, last digit of Region Code)       
826 | E | 7         
Ex. 826E7 = London;  826E2 = North West;
826E9 = South West; 
826E5 = West Midlands; 
826E6 = East of England; 
826E4 = East Midlands; 
826E3 = Yorkshire and The Humber; 
826E1 = North East; 
826E8 = South East  

Note: Does not conform to: [Region Codes](http://opendatacommunities.org/resources?dataset=ons-geography-administration&type_uri=http%3A%2F%2Fopendatacommunities.org%2Fdef%2Fontology%2Fadmingeo%2FRegion)         

See also:
[Subdivisions of England](https://en.wikipedia.org/wiki/Subdivisions_of_England)     
[England](http://webarchive.nationalarchives.gov.uk/20160105160709/http://www.ons.gov.uk/ons/guide-method/geography/beginner-s-guide/administrative/england/index.html)


###County (Not Definitive)
Type: Alphanumeric, 7              
Kingdom (3, numeric) | Country or Province (1, alphabetic) | Region (1, numeric) | County (2, numeric, last two digits of County Code)            
826 | E | 2 | 06       
Ex. 826E206 = Cumbria, North West England;  826E424 = Nothinghamshire, East Midlands, England       

See: [Administrative Divisions in England since 2009, Wikipedia](https://upload.wikimedia.org/wikipedia/commons/6/6a/England_administrative_divisions_since_2009.svg)
See: [Counties England, Wikipedia](https://en.wikipedia.org/wiki/Counties_of_England)        
See: [Counties UK, Wikipedia](https://en.wikipedia.org/wiki/List_of_counties_of_the_United_Kingdom)      

###Districts

###Constituency (Westminster Lower House, similar to Congressional Districts)   
Type: Alphanumeric, 7                 
Kingdom (3, numeric) | Country or Province (1, alphabetic) | CD (2, alphabetic) | Constituency (4, numeric, last four digits of Constituency Code)               
826 | E | CD | 0533               
Ex. 826ECD0533 = E14000533          
Ex. 826SCD0001 = S14000001   
Ex. 826WCD0041 = W07000041   
Ex. 826NCD0001 = N06000001      

Note: We use CD as a delimiter for Constituency Division, as it is similar to the US Congressional District          
Note: Does not conform to Const Codes            
         
Note: 650. The 591 constituencies in England, Northern Ireland and Wales (533 in England; 40 in Wales; and 18 in Northern Ireland) came into force at the May 2010 General Election. In Scotland, the 72 constituencies were reduced to 59 in May 2005.                  
See: [The Economist Map](http://www.economist.com/node/21648856)             
See: [Constituencies, Wikipedia](https://en.wikipedia.org/wiki/List_of_United_Kingdom_Parliament_constituencies)         
See: [UK parliamentary constituencies](http://webarchive.nationalarchives.gov.uk/20160105160709/http://www.ons.gov.uk/ons/guide-method/user-guidance/parliamentary-constituencies/index.html)          


###Electoral Wards

###Scotland: Council Areas

###Electoral Wards & Communities

###Wales: Unitary Authorities

###Electoral Wards & Communities

###Northern Ireland: District Council Areas

###Electoral Wards

###Workplace Zones
This is similar to France's Zones d'Emploi. The difference however is that England has 50868 and France has 304 Zones d'Emploi!

See:  
[Administrative Geography](http://webarchive.nationalarchives.gov.uk/20160105160709/http://www.ons.gov.uk/ons/guide-method/geography/beginner-s-guide/administrative/index.html)
http://opendatacommunities.org/data/ons-geography-administration    
http://www.nomisweb.co.uk/census/2011/key_statistics   


###Postcode
Type: Alphanumeric, 11-13              
Country (3, numeric, ISO) | ZP (2, alphabetic) | Postcode (6-8, numeric)                   
826 | ZP | SW1W0NY             
Example: 826ZPSW1W0NY for Postcode SW1W 0NY in Warwick, Greater London            
                                                 
Note: No spaces between the postcode parts 

The postcodes are alphanumeric, and are variable in length: ranging from six to eight characters (including a space) long. Each post code is divided into two parts separated by a single space: the outward code and the inward code respectively. The outward code includes the postcode area and the postcode district, respectively. The inward code includes the postcode sector and the postcode unit respectively. Examples of postcodes include "SW1W 0NY", "PO16 7GZ", "GU16 7HF", or "L1 8JQ".     


##IN
India
356

###State & Union Territories
Type: Numeric, 5      
Country (3, numeric, ISO) | State (2, numeric, Census India)      
356 | 33     
Ex. 35633 = Tamil Nadu     
As of June 2, 2014 India has 29 States and seven Union Territories. New: Telangana,36, TS (ISO: IN-TG)     
Reference: http://www.ddvat.gov.in/docs/List%20of%20State%20Code.pdf    

###District (Zilla)
Type: Numeric, 7     
Country (3, numeric, ISO) | State (2, numeric, Census India) | District (2, numeric, Census India)    
356 | 33 | 02   
Ex. 3563302 = Chennai, Tamil Nadu    
Updated: https://en.wikipedia.org/wiki/List_of_districts_in_India    

###Subdistrict (Taluk/Tehsil/Mandal/Circle)    
Type: Numeric, 10    
Country (3, numeric, ISO) | State (2, numeric, Census India) | District (2, numeric, Census India) | Subdistrict (3, numeric, Census India)
356 | 33 | 07 | 001    
Ex. 3563307001 = Mettur, Salem, Tamil Nadu     
Reference for 2011: http://www.censusindia.gov.in/2011census/maps/atlas/00part2.pdf    

Throughout India, there is a three-tier local body/Panchayath Raj system within the state.     
Tehsil/taluka/mandal is the second layer of this system. Above them are the districts/zilla and below them are the gram panchayats/villages.   

###DRDA / Block / Village

### Postal Index Number (PIN)
Type: Alphanumeric, 11     
Country (3, numeric, ISO) | ZP (2, alphabetic) | PIN (6, alphanumeric, Canadapost)       
356 | ZP | 456001        
Ex.  356ZP456001 = The PIN code of Ujjain in Madhya Pradesh     


Reference:
http://www.censusindia.gov.in/2011census/maps/atlas/India%20map.html     
http://www.censusindia.gov.in/2011census/maps/atlas/00part2.pdf    
https://www.mail.nic.in/docs/MailService_e-mail_address_Policy_WithCodes.pdf    
https://data.gov.in/catalog/number-districts-drdas-blocks-villages-country    
https://www.iso.org/obp/ui/#iso:code:3166:IN    
http://www.indianewsbulletin.com/2014-full-list-of-indian-states-capitals-and-their-chief-ministers    
https://en.wikipedia.org/wiki/Postal_Index_Number    
http://datameet.org/wiki/indiangeospatialdata    


##KE
Kenya     
404 

###County
Type: Numeric, 6    
Country (3, numeric, ISO) | County (3, numeric)         
404 | 101        
Ex. 404101 = Nairobi      

Kenya is divided into 47 semi-autonomous counties that are headed by governors who were elected in the first general election under the new constitution in March 2013.  
In August 2009, the High Court of Kenya declared all districts created after 1992 illegal. The judge stated that the districts were created "in complete disregard of the law". As a result, Kenya had only 46 legal districts (excluding Nairobi with its special constitutional status as the capital of the country). Following the March 2013 elections, these 46 districts - together with the City of Nairobi - constitute the 47 counties into which Kenya is now divided administratively, and they are also the 47 constituencies for the elections to the national senate.   
See more:        
http://www.knbs.or.ke/      
http://www.knbs.or.ke/index.php?option=com_phocadownload&view=category&id=99&Itemid=639        
http://www.arcgis.com/home/item.html?id=5f83ca29e5b849b8b05bc0b281ae27bc   
https://en.wikipedia.org/wiki/Sub-Counties_of_Kenya   


##TW
Republic of China (ROC)/Taiwan
158

See more:
http://eng.stat.gov.tw/
https://en.wikipedia.org/wiki/List_of_administrative_divisions_of_Taiwan
https://en.wikipedia.org/wiki/Administrative_divisions_of_the_Republic_of_China


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


###County Subdivision (MCD, CCD, UT)     
Type: Numeric, 13       
Country(3, numeric, ISO) | State (2, numeric, FIPS) | County (3, numeric, FIPS) | Sub County (5, numeric, FIPS)      
840 | 33 | 007 | 05140       
Ex. 8403300705140 = Berlin city, NH     
See also: 
http://www.census.gov/geo/reference/gtc/gtc_cousub.html    
http://www2.census.gov/geo/pdfs/reference/GARM/Ch2GARM.pdf    
Figure 2-3. Small Area Geography in the 1990 Census    


###Place    
Type: Numeric, 10       
Country(3, numeric, ISO) | State (2, numeric, FIPS) | P (1, alphabetic | Place (5, numeric, Census)       
840 | 33 | P | 45140       
Ex. 84033P45140 = Manchester, New Hampshire     
See:      
http://www2.census.gov/geo/pdfs/reference/GARM/Ch2GARM.pdf         
Figure 2-3. Small Area Geography in the 1990 Census          


###Census Tract or Block Numbering Area (BNA) (not definitive)    
Type: Numeric, 16       
Country(3, numeric, ISO) | State (2, numeric, FIPS) | County (3, numeric, FIPS) | CT (2, alphabetic)| Census Tract (6, numeric)              
840 | 06 | 001 | CT | 422200            
Ex. 84006001CT422200 = Census Tract 4222 in Alameda County     
The dot is not existing, but we add leading and trailing zeros (always 6).         
Example Census Tracts: 21 = 002100; 2.02 = 000202; 1210 = 121000; 1220.02 = 122002        

See:          
http://www2.census.gov/geo/pdfs/reference/GARM/Ch2GARM.pdf           
Figure 2-3. Small Area Geography in the 1990 Census            


###Block (not definitive)
Type: Alphanumeric, 21              
Country(3, numeric, ISO) | State (2, numeric, FIPS) | County (3, numeric, FIPS) | CT (2, alphabetic) | Census Tract (6, numeric) | Block (5, alphanumeric)             
840 | 06 | 001 | CT | 422200 | 10290              
E.g. 84006001CT42220010290 = Block 1029, in Census Tract 4222 in Alameda County         
See:                         
http://www2.census.gov/geo/pdfs/reference/GARM/Ch2GARM.pdf                    
Figure 2-3. Small Area Geography in the 1990 Census         


###ZIP Code / ZIP Code Tabulation Area (ZCTA)
Type: Alphanumeric, 10    
Country (3, numeric, ISO) | ZP (2, alphabetic) | ZIP Code (5, numeric, USPS)      
840 | ZP | 94702    
Ex. 840ZP94702 = ZIP Code 94702 

###Congressional District
Type: Alphanumeric, 12       
Country(3, numeric, ISO) | CD114 (5, alphanumeric) | State (2, numeric, FIPS) | Congressional District (2, numeric, Census)     
840 | CD114 | 06 | 13      
Ex. 840CD1140613 = 13th Congressional District in California for the 114th Congress     
Note: The Census uses: STATEFP: 06, CD114FP: 13, GEOID2: 0613.    

###Precinct Code
Type: Alphanumeric, 15-21   
Country(3, numeric, ISO) | State (2, numeric, FIPS) | County (3, numeric, FIPS) | (Sub County (5, numeric, FIPS) | PCT (3, alphabetic) | Precinct Number (4-5, alphanumeric)       
840 | 06 | 075 | PCT | 1117                
840 | 26| 107 | 00400 | PCT | 00001              
Ex. 84006075PCT1117 = Precinct 1117 in San Francisco, California                 
Ex. 8402610700400PCT00001  = Precint 1 in Addison township, Oakland County, Michigan, USA             
Ex. 84019001PCT1NW = Precinct 1NW, Adair County, Iowa               
Sometimes there are combinations of ward and precinct info into one (eg. 2, Ward + 3, Precinct = 5, Precinct).                 
As Precinct is clearly delimited and not followed by anything else, we do not have to keep the same number of digits.               

###State Senate District
Type: Alphanumeric, 9       
Country(3, numeric, ISO) | State (2, numeric, FIPS) | SD (2, alphabetic) | Senate District (2, numeric, CA.gov)     
840 | 06 | SD | 09     
Ex. 84006SD09  = State Senate (District 9) in California (40 in total)    
Note: With trailing zeros     
See: http://senate.ca.gov/senatedistricts    

###State Assembly District
Type: Alphanumeric, 10       
Country(3, numeric, ISO) | State (2, numeric, FIPS) | AD (2, alphabetic) | Assembly District (3, numeric)     
840 | 06 | AD | 015    
Ex. 84006AD015 = State Assembly (District 15) in California (80 in total); Texas has 150  
Note: With leading zeros   
https://en.wikipedia.org/wiki/California_State_Assembly_districts   


##ZA
South Africa
710

###Province

###Municipality

###Ward

https://en.wikipedia.org/wiki/Administrative_divisions_of_South_Africa
https://github.com/capesean/electionmap.co.za



##Standards:   

GENC: https://nsgreg.nga.mil/genc/discovery   
ISO 3611-1: https://en.wikipedia.org/wiki/ISO_3166-1   
FIPS: http://quickfacts.census.gov/qfd/meta/long_fips.htm   
The World Factbook: https://www.cia.gov/library/publications/the-world-factbook/appendix/appendix-d.html 

See also:
Google API: Address Types and Address Component Types   
https://developers.google.com/maps/documentation/geocoding/intro

HASC, similar to GeoIDs, but with a different intent
http://www.iscramlive.org/ISCRAM2013/files/198.pdf



