
##2010 Shapes
Source:   
http://www.bfs.admin.ch/bfs/portal/de/index/dienstleistungen/geostat/datenbeschreibung/generalisierte_gemeindegrenzen.html

g1g10_shp_121130     
G1G10.csv (shp + dbf exported as csv)     
https://github.com/datamapio/geoid/blob/master/CH/municipality/2010/G1G10.csv     
Municipalities (with Kommunanzen): 2600    

g2g10_shp_121130    
G2G10.csv     
https://github.com/datamapio/geoid/blob/master/CH/municipality/2010/G2G10.csv    
Municipalities (with Kommunanzen): 2600    

g3g10_shp_121130    
G3G10.csv    
https://github.com/datamapio/geoid/blob/master/CH/municipality/2010/G3G10.csv    
Municipalities (without Kommunanzen): 2596     

##Initiative   
Initiative results (without Swiss Abroad)    
2573 municipalities    


##Difference
###Between g2 and g3
```
## g3 doesn't contain Staatswald Galm and other Kommunanzen etc.
..,...,...,...,...
,2338,1007,10,"La Verrerie"
---,2391,1005,10,"Staatswald Galm"
,2401,1101,11,Egerkingen
...,...,...,...,...
,5324,2108,21,"Avegno Gordevio"
---,5391,2101,21,"Comunanza Medeglia/Cadenazzo"
---,5394,2105,21,"Comunanza Capriasca/Valcolla"
,5397,2104,21,Centovalli
...,...,...,...,...
,6300,2313,23,Zermatt
---,6391,2304,23,"Kommunanz Reckingen-Gluringen/Grafschaft"
,6401,2401,24,Auvernier
...,...,...,...,...
```

###Initiative and Shapes
Between g2 and ext6
```
@@,gdenr
...,...
,388
---,389
,390
...,...
,407
---,408
,409
...,...
,416
---,417
,418
---,419
,420
,421
---,422
,423
...,...
,534
---,535
,536
...,...
,632
---,661
,662
...,...
,867
---,868
,869
,870
---,871
,872
...,...
,876
---,877
---,878
,879
...,...
,2338
---,2391
,2401
...,...
,5010
---,5011
,5012
...,...
,5097
---,5098
,5099
---,5101
,5102
,5105
---,5106
,5108
,5109
---,5110
,5112
...,...
,5115
---,5116
,5117
...,...
,5121
---,5123
,5125
---,5127
---,5128
,5129
...,...
,5133
---,5134
,5135
...,...
,5151
---,5153
,5154
...,...
,5163
---,5165
,5167
...,...
,5216
---,5217
,5219
...,...
,5222
---,5223
,5224
...,...
,5237
+++,5238
,5242
...,...
,5324
---,5391
---,5394
,5397
+++,5398
,5401
...,...
,6300
---,6391
,6401
...,...
,6810
---,7001
---,7002
---,7003
---,7004
---,7005
---,7006
---,7007
---,7008
---,7009
---,7010
---,7011
---,7101
---,7111
---,7301
---,9040
---,9050
---,9073
---,9089
---,9148
---,9151
---,9157
---,9163
---,9172
---,9175
---,9179
---,9216
---,9239
---,9267
---,9270
---,9276
---,9294
---,9326
---,9710
---,9711
---,9751
---,9757
```

```
Interesting find!   
The election was on November 28, and on November 21 this happened:

+++,5238 Monteceneri
https://en.wikipedia.org/wiki/Monteceneri
Monteceneri is a municipality in the district of Lugano in the canton of Ticino in Switzerland. It was created on 21 November 2010 through the merger of the municipalities of Medeglia, Bironico, Camignolo, Rivera and Sigirino.  
5011	2101	21	Medeglia
(5391	2101	21	Comunanza Medeglia/Cadenazzo => no one votes here, so this doesn't appear in the election results)
5153	2105	21	Bironico
5165	2105	21	Camignolo
5217	2105	21	Rivera
5223	2105	21	Sigirino


+++,5398 Gambarogno
https://en.wikipedia.org/wiki/Gambarogno  
Gambarogno is a municipality in the district of Locarno in the canton of Ticino in Switzerland. It was created on 25 April 2010 through the merger of the municipalities of Caviano, Contone, Gerra, Indemini, Magadino, Piazzogna, San Nazzaro, Sant'Abbondio and Vira.
5098	2104	21	Caviano
5101	2104	21	Contone
5106	2104	21	Gerra (Gambarogno)
5110	2104	21	Indemini
5116	2104	21	Magadino
5123	2104	21	Piazzogna
5127	2104	21	San Nazzaro
5128	2104	21	Sant'Abbondio
5134	2104	21	Vira (Gambarogno)
```

###Comparing/Decounting
g2 = 2637; 2600 if lakes and LI etc. is taken away    
election: 2573    

```
2573     
+  4 Kommunanzen       
+ 11 non polling municipalities     
+ 14 fusioned municipalities    
-  2 new municipalities     
= 2600    
```

Here is the detail:

```
---,389
---,408
---,417
---,419
---,422
---,535
---,661
---,868
---,871 Kienersrüti (has no polling station, they vote in 885 Uttigen)
http://www.bfs.admin.ch/bfs/portal/en/index/international/03/04/agglomerationen/daten.html
---,877
---,878  
Like in 2014, the above, except 871, voted elsewhere. See:    
https://github.com/datamapio/geoid/blob/master/CH/municipality/2014/ext2_initiative_20140902.csv


---,2391 Staatswald Galm
---,5011 Fusion with 5238
---,5098 Fusion with 5398
---,5101 Fusion with 5398
---,5106 Fusion with 5398
---,5110 Fusion with 5398
---,5116 Fusion with 5398
---,5123 Fusion with 5398
---,5127 Fusion with 5398
---,5128 Fusion with 5398
---,5134 Fusion with 5398
---,5153 Fusion with 5238
---,5165 Fusion with 5238
---,5217 Fusion with 5238
---,5223 Fusion with 5238, Monteceneri
+++,5238 NEW: Monteceneri
---,5391 Comunanza Medeglia/Cadenazzo
---,5394 Comunanza Capriasca/Valcolla
+++,5398 NEW: Gambarogno
---,6391 Kommunanz

```



