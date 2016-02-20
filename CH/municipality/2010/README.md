
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
2600 with K   
2596 without K   
2596 - 2573 = 23
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

Interesting find!   
+++,5238 Monteceneri    
+++,5398 Gambarogno   
