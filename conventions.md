#Conventions

##Proposal
Proposal as of March 22nd

##REF: File Name

au = Area Unit    

REF_location_au_addtionalinfo_date.csv     
E.g. REF_ch_municipality_with_swiss_abroad_20160228.csv   

##REF: Column Order

###Naming
Our names are all lowercase and using "_" to separate words    
External names that follow are kept as is.    

au = Area Unit    
lg = ISO language identifier (eg. fr, de, nl)    
c = complete    
l = levels    

id | au_name | au_name_lg (none, 1 or more) | au_code (none, 1 or more) | match_code_c | match_code_l (none, 1, or more) | higher_up_aus | external_names         

Explanation:
id followed by the english version of the area unit name (if available), followed by names in other languages.     
This in turn is followed by one or more area unit codes like for example: AL, AK, CA etc.    
This is turn is followed by the matching code, first as complete as possible: e.g. county fips 06001, always with leading zeroes, 
then separated: e.g. state_fips 06, county_fips 001.      
After that come additional higher up area units, always the highest first.     

When our own list is completed, we add the external column names and we leave them as is. The intention of the REF file is to provide matching     possibilities for external data as well as a link to the map.    


###Minimum

id | au_name | match_code         