# Municipalities in 2014

## Municipalities on February 9, 2014
 
| Municipalities/Other                       | Number    | 
|--------------------------------------------|:---------:|     
| Municipalities + Swiss from abroad         |    2953   |                                             
| Municipalities without polling station (A) |      10   |  
| Swiss from abroad (B)                      |     -11   |      
| **Total**                                  |  **2952** |   
 


###A: One municipality votes with another

1) In der Wahl- und Abstimmungsstatistik werden Gemeinden mit so genannt „gemeinsamer Urne“ geführt. Dabei werden zwei oder mehrere Gemeinden zusammengefasst, deren Stimmzettel gemeinsam ausgezählt werden.                       
Folgende Übersicht enthält die Gemeinden ohne Wahl-/Stimmbüro und die Gemeinde, wo die Stimmzettel ausgezählt werden, den sog. Urnenstandort.   

```                     
Gemeinden ohne eigenes Wahl-/Stimmbüro:                  Urnenstandort          
Gemeinde-Nr.Gemeinde                    Gemeinde-Nr. Gemeinde    Kanton  
389 Meienried                           383      Büren              BE     
408 Hellsau                             410      Höchstetten        BE    
417 Niederösch                          405      Ersigen            BE    
419 Oberösch                            405      Ersigen            BE     
422 Rüti bei Lyssach                    416      Mötschwil          BE  
535 Deisswil bei Münchenbuchsee         553      Wiggiswil          BE    
661 Clavaleyres                         669      Münchenwiler       BE  
868 Jaberg                              872      Kirchdorf          BE    
877 Niedermuhlern                       888      Wald               BE  
878 Noflen                              872      Kirchdorf          BE      
``` 

###B: Swiss from foreign countries

``` 
9030    LU-Ausland-CH           3,839   1,753   45.7    1,711   551     1,160   32.2        
9040    UR-Ausland-CH           413     166     40.2    166     57      109     34.3       
9100    FR-CH de l'étranger     4,349   1,765   40.6    1,738   596     1,142   34.3      
9120    BS-Ausland-CH           7,043   2,780   39.5    2,760   784     1,976   28.4      
9160    AI-Ausland-CH           301     108     35.9    104     51      53      49.0      
9170    SG-Ausland-CH           5,793   2,683   46.3    2,657   1,011   1,646   38.1      
9190    AG-Ausland-CH           7,510   2,990   39.8    2,960   1,015   1,945   34.3      
9200    TG-Ausland-CH           2,808   1,230   43.8    1,217   453     764     37.2      
9220    VD-CH de l'étranger     15,211  5,615   36.9    5,529   1,706   3,823   30.9     
9230    VS-CH de l'étranger     4,536   1,678   37.0    1,603   543     1,060   33.9        
9250    GE-CH de l'étranger     21,299  9,507   44.6    9,366   2,684   6,682   28.7      
``` 

See also:
How the vote of the Swiss from abroad can change the result
http://www.tagesanzeiger.ch/schweiz/standard/Auslandschweizer-kippten-Nein-in-ein-Ja/story/17574331
The number of Swiss living abroad:
[BfS](http://www.bfs.admin.ch/bfs/portal/de/index/themen/01/02/blank/key/schweizer_im_ausland.html)
[NZZ, 2015: 761‘930] (http://www.nzz.ch/schweiz/aktuelle-themen/im-vergangenen-jahr-wuchs-die-zahl-der-auslandschweizer-um-rund-2-prozent-auf-761930-personen-1.18683329)

The city of Zurich has since Autumn 2014 a special Swiss abroad district:  
https://www.stadt-zuerich.ch/prd/de/index/bevoelkerungsamt/Stab/SZZ/Auslandsschweizer.html


## How to visualize the two cases?
Case A:    
a) Do not show results for A, as there are none. But they vote     
b) Or use the same percentage color for both municipalities    

Case B:    
11 cantons do regroup the Swiss voters from abroad. The number of people is quite significant.     
For these 11 cantons the number is 73,102 people entitled to vote and 30,275 who did vote.     
This is more than the size of several cantons.    

##REF File with 2352 or 2356 Municipalities
We will compare the EXT file from the votation and compare it to the csv file from the shape [download](http://www.bfs.admin.ch/bfs/portal/de/index/dienstleistungen/geostat/datenbeschreibung/generalisierte_gemeindegrenzen.html).

### Shapefile + CSV files
Year 2014   
16195 KB    Generalisierte Gemeindegrenzen: Geodaten   
(gd-b-00.03-877-gg14)   
Bundesamt für Statistik BFS   

The file [glg2014.csv](https://github.com/datamapio/geoid/blob/master/CH/municipality/2014/g1g14.csv) contains 2356 municipalities. 
So let's figure out the difference and the reason for the difference.


##The Difference: The Kommunanzen or Comunanzas

The following are part of glg2014.csv, but not part of election data

GeoID: 75610052391     
2391 Staatswald Galm (O inhabitants)- not part of any municipality (Canton of Freiburg)    
https://de.wikipedia.org/wiki/Staatswald_Galm   

GeoID: 75621015391    
5391 Comunanza Cadenazzo/Monteceneri (0 inhabitants), part of Cadenazzo & Monteceneri    
https://it.wikipedia.org/wiki/Comunanza_Cadenazzo/Monteceneri    

GeoID: 75621055394       
5394 Comunanza Capriasca/Lugano (0 inhabitants) part of Capriasca and Lugano    
https://de.wikipedia.org/wiki/Kommunanz_Capriasca/Lugano     

GeoID: 75623046391    
6391 Kommunanz Reckingen-Gluringen/Grafschaft (0 inhabitants), part of Reckingen-Gluringen and Grafschaft VS in Obergoms    
https://de.wikipedia.org/wiki/Kommunanz_Reckingen-Gluringen/Grafschaft    

We will keep them in the reference file, so that the polygons are referenced, but they will not get data.

## CONCLUSION
So regarding the election data from February 2014, we will have:
- 2356 polygons, representing 2352 municipalities and 4 "Kommunanzen"
- 2342 municipalities with voting results, 14 which remain void (e.g. grey areas on a map)
- 11 cantonal units for Swiss abroad (there are 26 cantons, but only 11 do show the Swiss abroad separately).    
  One way to visualize the Swiss abroad could be to use the forms of the cantons proportionally smaller and show them under the map.




