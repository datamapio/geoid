#BELGIUM

##3 Regions

Flamand Region (5 Provinces)   
Wallonne Region (5 Provinces)    
& Bruxelles Capital   

###datamap Proposal
Type: Alphanumeric, 4    
Country (3, numeric, ISO) | Region Code (1, alphabetic)    
056 | W    
Examples:    
056W = Wallonne Region   
056F = Flamand Region    
056B = Bruxelles Capital Region    
NOTE: Does not conform to codes used in Belgium (2000, 3000, 4000)     

####REF File
https://github.com/datamapio/geoid/blob/master/BE/region/be_region_2013.csv

##10 Provinces & Bruxelles Capital (since 1995)

- 10000: Antwerpen (Anvers) dont le chef-lieu est Antwerpen (Anvers).    
- 20002: Brabant wallon dont le chef-lieu est Wavre (Waver).    
    1. Le district de « Wavre-Jodoigne-Perwez » composé 18 communes    
    2. Le district de Nivelles-Genappe composé de 9 communes    
- 20001: Vlaams-Brabant (Brabant flamand) dont le chef-lieu est Leuven (Louvain).     
- 50000: Hainaut dont le chef-lieu est Mons (Bergen).    
- 60000: Liége dont le chef-lieu est Liége (Luik-Lüttich).    
- 70000: Limburg (Limbourg) dont le chef-lieu est Hasselt.    
- 80000: Luxembourg dont le chef-lieu est Arlon (Aarlen).    
- 90000: Namur dont le chef-lieu est Namur (Namen).    
- 40000: Oost-Vlaanderen (Flandre orientale) dont le chef-lieu est Gent (Gand).
- 30000: West-Vlaanderen (Flandre occidentale) dont le chef-lieu est Brugge (Bruges).   
- & 4000 Bruxelles Capital (the Capital is not a province)  

###datamap Proposal
Type: Alphanumeric, 5    
Country (3, numeric, ISO) | Region Code (1, alphabetic) | Province Code (1, numeric)    
056 | W | 2   
Ex. 056W2 = Brabant wallon    
Ex. 056F2 = Vlaams-Brabant   
Ex. 056F4 = Flandres Orientale   
Note: We use the alphabet to keep the link to the province numbers.    

###REF File
https://github.com/datamapio/geoid/blob/master/BE/province/be_province_2013.csv

##Arrondissments

```
RÉGION DE BRUXELLES-CAPITALE			4000
- Arrondissement de Bruxelles-Capitale	21000

RÉGION FLAMANDE	(22)					2000
- Province d'Anvers	(3)					10000
  - Arrondissement d'Anvers				11000
  - Arrondissement de Malines			12000
  - Arrondissement de Turnhout			13000
- Province du Brabant Flamand (2)		20001
  - Arrondissement de Hal-Vilvorde		23000
  - Arrondissement de Louvain			24000
- Province de Flandre Occidentale (8)	30000
  - Arrondissement de Bruges			31000
  - Arrondissement de Courtrai			34000
  - Arrondissement de Dixmude			32000
  - Arrondissement de Furnes			38000
  - Arrondissement d'Ostende			35000
  - Arrondissement de Roulers			36000
  - Arrondissement de Tielt				37000
  - Arrondissement d'Ypres				33000
- Province de Flandre Orientale (6)		40000
  - Arrondissement d'Alost				41000
  - Arrondissement d'Audenarde			45000
  - Arrondissement d'Eeklo				43000
  - Arrondissement de Gand				44000
  - Arrondissement de Saint-Nicolas		46000
  - Arrondissement de Termonde			42000
- Province du Limbourg (3)				70000
  - Arrondissement de Hasselt			71000
  - Arrondissement de Maaseik			72000
  - Arrondissement de Tongres			73000

RÉGION WALLONNE	(20)					3000
- Province du Brabant Wallon (1)		20002
  - Arrondissement de Nivelles			25000
- Province du Hainaut (7)				50000
  - Arrondissement d'Ath				51000
  - Arrondissement de Charleroi			52000
  - Arrondissement de Mons				53000
  - Arrondissement de Mouscron			54000
  - Arrondissement de Soignies			55000
  - Arrondissement de Thuin				56000
  - Arrondissement de Tournai			57000
- Province de Liège	(4)					60000
  - Arrondissement de Huy				61000
  - Arrondissement de Liège	            62000
  - Arrondissement de Verviers			63000
  - Arrondissement de Waremme			64000
- Province du Luxembourg (5)			80000
  - Arrondissement d'Arlon				81000
  - Arrondissement de Bastogne			82000
  - Arrondissement de Marche-en-Famenne	83000
  - Arrondissement de Neufchâteau		84000
  - Arrondissement de Virton			85000
Province de Namur (3)					90000
  - Arrondissement de Dinant			91000
  - Arrondissement de Namur				92000
  - Arrondissement de Philippeville		93000

```
According to Wikipedia, there are 43 arrondissements:
https://en.wikipedia.org/wiki/Arrondissements_of_Belgium
https://github.com/datamapio/geoid/blob/master/BE/arrondissement/be_arrondissement_wikipedia.csv


###datamap Proposal
Type: Alphanumeric, 6      
Country (3, numeric, ISO) | Region Code (1, alphabetic) | Arrondissement Code (2, numeric, INS)     
056 | F | 23     
Ex. 056F23 = Arrondissement de Hal-Vilvorde, Braband Flamand    
Note: We drop the 3 trailing zeros    


##Municipalities
According to Wikipedia there are 589 municipalities: 
https://en.wikipedia.org/wiki/Municipalities_of_Belgium


###datamap Proposal     
Type: Alphanumeric, 9    
Country (3, numeric, ISO) | Region Code (1, alphabetic) | Municipality Code (5, numeric, INS)    
056 | B | 21015    
Ex. 056B21015 = SCHAERBEEK, Région Bruxelles-Capitale (21015)    
Ex. 056F23027 = Hal, Hal-Vilvorde, Brabant Flamand (23027)   

###REF File
https://github.com/datamapio/geoid/blob/master/BE/municipality/be_municipality_2013.csv 


##Municipality Parts/Sections, City Districts (Deelgemeenten, Districts (Antwerpen), Ancienne commune, Section de commune)
Type: Alphanumeric, 10      
Country (3, numeric, ISO) | Region Code (1, alphabetic) | Municipality Code (5, numeric, INS) | M. Part (1, alphabetic)    
056 | F | 71053 | B      
Ex. 056F71053B = Halmaal, Sint-Truiden (Saint-Trond), Hasselt, Limbourg     


##Statistical Sectors (Statistische Sector)
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


